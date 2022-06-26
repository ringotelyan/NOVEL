class NovelComment < ApplicationRecord
  belongs_to :user
  belongs_to :novel

  validates :comment, length: { minimum: 2, maximum: 100 }
end
