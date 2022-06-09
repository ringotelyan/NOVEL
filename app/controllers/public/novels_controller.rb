class Public::NovelsController < ApplicationController

  def new
    @novel = Novel.new
  end

  # 投稿データの保存
  def create
    @novel = Novel.new(novel_params)
    @novel.user_id = current_user.id # 投稿データにログイン中のユーザーのIDを持たせる
    if @novel.save
      redirect_to public_novel_path(@novel.id)
    else
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
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def update
    novel = Novel.find(params[:id])
    novel.update(novel_params)
    redirect_to public_novel_path(novel.id)
  end

  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to public_novels_path
  end

  # 投稿データのストロングパラメータ
  private

  def novel_params
    params.require(:novel).permit(:title, :body)
  end

end
