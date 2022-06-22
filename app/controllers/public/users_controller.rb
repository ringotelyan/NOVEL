class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def index
    users = User.where.not(name: "ゲストユーザー").deleted
    @users = Kaminari.paginate_array(users).page(params[:page]).per(10)
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @novels = @user.novels # アソシエーションを持っているもの同士の記述
    favorites = Favorite.where(user_id: @user.id).pluck(:novel_id)
    @favorite_novels = Novel.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報の編集に成功しました"
      redirect_to public_user_path(@user)
    else
      flash[:notice] = "会員情報の編集に失敗しました"
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    # 退会状態を作り出す
    @user.update(is_deleted: true)
    # セッション情報をすべて削除
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to public_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲストユーザー"
      flash[:notice] = "ゲストユーザーはプロフィール編集画面へ遷移できません"
      redirect_to public_novels_path
    end
  end

end
