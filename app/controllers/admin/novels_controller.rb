class Admin::NovelsController < ApplicationController
  def index
    @novels = Novel.all
  end

  def show
    @novel = Novel.find(params[:id])
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def update
    @novel = Novel.find(params[:id])
    @novel.update(novel_params)
    redirect_to admin_novel_path(@novel)
  end

  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to admin_novels_path
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :body)
  end
end
