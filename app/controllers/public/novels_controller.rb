class Public::NovelsController < ApplicationController
  before_action :correct_user, only: [:update, :edit]
  before_action :ensure_guest_user, only: [:new]

  def new
    @novel = Novel.new
    @genres = Genre.all
  end

  # 投稿データの保存
  def create
    @novel = Novel.new(novel_params)
    @novel.user_id = current_user.id # 投稿データにログイン中のユーザーのIDを持たせる
    if @novel.save
      flash[:notice] = '小説の投稿に成功しました'
      redirect_to public_novel_path(@novel.id)
    else
      @genres = Genre.all
      flash.now[:alert] = '小説の投稿に失敗しました'
      render :new
    end
  end

  def index
    @novels = Novel.all
    @user = current_user
  end

  def show
    @novel = Novel.find(params[:id])
    @novel_comment = NovelComment.new
    @genre = @novel.genre_id
  end

  def edit
    @novel = Novel.find(params[:id])
    @genres = Genre.all
  end

  def update
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      flash[:notice] = '小説の編集に成功しました'
      redirect_to public_novel_path(@novel.id)
    else
      @genres = Genre.all
      flash.now[:alert] = '小説の編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to public_novels_path
  end

  # 投稿データのストロングパラメータ
  private

  def novel_params
    params.require(:novel).permit(:title, :body, :genre_id)
  end

  def correct_user
    @novel = Novel.find(params[:id])
    @user = @novel.user
    redirect_to (public_novels_path) unless @user == current_user
  end

  def ensure_guest_user
    @user = current_user
    if @user.name == "ゲストユーザー"
      flash[:notice] = "ゲストユーザーは新規投稿画面へ遷移できません"
      redirect_to public_novels_path
    end
  end

end
