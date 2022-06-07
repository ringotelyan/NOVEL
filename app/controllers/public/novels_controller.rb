class Public::NovelsController < ApplicationController

  def new
    @novel = Novel.new
  end

  # 投稿データの保存
  def create
    @novel = Novel.new(novel_params)
    @novel.user_id = current_user.id # 投稿データにログイン中のユーザーのIDを持たせる
    @novel.save
    redirect_to public_novels_path
  end

  def index
    @novels = Novel.all
  end

  def show
  end

  # 投稿データのストロングパラメータ
  private

  def novel_params
    params.require(:novel).permit(:title, :body)
  end

end
