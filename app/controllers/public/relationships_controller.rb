class Public::RelationshipsController < ApplicationController
  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    @users = User.where(is_deleted: false)
    @user = User.find(params[:user_id])
    # "request.referer"は遷移前のURLを取得する際に使う
  end

  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    @users = User.where(is_deleted: false)
    @user = User.find(params[:user_id])
  end

  # フォロー一覧
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  # フォロワー一覧
  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end
end
