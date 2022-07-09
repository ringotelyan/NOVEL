class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :novel

  # １人１ゴフノベル１ブックマーク
  # favoritesテーブルのuser_idカラムについて、一意性(uniquness)の制約をかける。ただし、novel_idの範囲内での一意性
  validates :user_id, uniqueness: { scope: :novel_id }
end
