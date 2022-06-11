class Novel < ApplicationRecord

  belongs_to :user
  has_many :novel_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 2000, maximum: 3000 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
