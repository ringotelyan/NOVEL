class Novel < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :novel_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # favoritesテーブルを通ってuserモデルのデータを持ってくる
  has_many :favorited_users, through: :favorites, source: :user
  has_many :view_counts, dependent: :destroy
  has_many :active_favorites, lambda { where(user_id: User.deleted.pluck(:id)) }, class_name: 'Favorite'
  has_many :active_comments, lambda { where(user_id: User.deleted.pluck(:id)) }, class_name: 'NovelComment'

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 3000 }

  enum status: { published: 0, draft: 1 }

  # 退会していない人のいいねだけを抽出するメソッド
  # def active_favorites
  #  favorites.joins(:user).where(user:{ is_deleted: false })
  # end

  # 退会していない人のコメントだけを抽出するメソッド
  # def active_comments
  #  novel_comments.joins(:user).where(user:{ is_deleted: false })
  # end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索方法分岐
  def self.looks(search, word)
    @novel = Novel.where("title LIKE? or body LIKE?", "%#{word}%", "%#{word}%")
  end
end
