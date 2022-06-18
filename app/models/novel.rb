class Novel < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :novel_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # favoritesテーブルを通ってuserモデルのデータを持ってくる
  has_many :favorited_users, through: :favorites, source: :user
  has_many :view_counts, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 2000, maximum: 3000 }

  def active_favorites
    favorites.joins(:user).where(user:{ is_deleted: false })
  end

  def active_comments
    novel_comments.joins(:user).where(user:{ is_deleted: false })
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索方法分岐
  def self.looks(search, word)
      @novel = Novel.where("title LIKE? or body LIKE?", "%#{word}%", "%#{word}%")
  end


end
