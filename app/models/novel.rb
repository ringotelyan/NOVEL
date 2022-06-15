class Novel < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :novel_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 2000, maximum: 3000 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @novel = Novel.where("title LIKE? or body LIKE?", "#{word}", "#{word}")
    elsif search == "forward_match"
      @novel = Novel.where("title LIKE? or body LIKE?", "#{word}%", "#{word}%")
    elsif search == "backward_match"
      @novel = Novel.where("title LIKE or body LIKE?", "%#{word}", "%#{word}")
    elsif search == "partial_match"
      @novel = Novel.where("title LIKE? or body LIKE?", "%#{word}%", "%#{word}%")
    else
      @novel = Novel.all
    end
  end


end
