class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :novels, dependent: :destroy
  has_many :novel_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy

  # フォローした、されたの関係
  # 「reverse_of_relationships」は「relationships」とごっちゃになるため、わかりやすくするために命名
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  scope :deleted, -> { where(is_deleted: false) }

  has_one_attached :profile_image

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 100 }
  validates :email, uniqueness: true

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # find_or_create_by!でゲストユーザーがなければ作成、あれば取り出す。
  # ゲストユーザーがないときに作成するユーザー情報を記述
  def self.guest
    find_or_create_by!(name: 'ゲストユーザー', email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストユーザー'
    end
  end

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  def active_followings
    # is_deletedがfalseの人のidだけを取って来る処理
    # selectメソッドは条件を指定してその条件を満たすものだけを抜き出す
    # {unless~~}は~~がfalseの時だけidを返すようになっている
    followings.select {|following|following unless following.is_deleted}
    # followings.where(is_deleted: false)
  end

  def active_followers
    followers.select {|follower|follower unless follower.is_deleted}
  end

  # 検索方法分岐
  def self.looks(search, word)
      @user = User.where("name LIKE?", "%#{word}%")
  end

  # ログイン時に退会済みのユーザーが同じアカウントでログインできないように制約
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
