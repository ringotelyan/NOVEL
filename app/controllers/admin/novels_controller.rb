class Admin::NovelsController < ApplicationController
  def index
    @novels = Novel.page(params[:page]).per(10)
  end

  def show
    @novel = Novel.find(params[:id])
    @genre = @novel.genre_id
    @user = @novel.user
  end

  def edit
    @novel = Novel.find(params[:id])
    @genres = Genre.all
  end

  def update
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      redirect_to admin_novel_path(@novel)
    else
      @genres = Genre.all
      render :edit
    end
  end

  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to admin_novels_path
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :body, :genre_id)
  end
end
