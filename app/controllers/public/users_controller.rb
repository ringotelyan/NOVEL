class Public::UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @novels = @user.novels # アソシエーションを持っているもの同士の記述
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
