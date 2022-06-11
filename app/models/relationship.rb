class Relationship < ApplicationRecord
  # class_name: "User"でUserモデルを参照
  # belongs_to :followerだけではfollowersテーブルを参照しにいってしまい、エラーになるため注意
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
