class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @novels = @user.novels # アソシエーションを持っているもの同士の記述
  end

  def edit
  end
end
