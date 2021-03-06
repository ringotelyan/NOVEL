class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = 'ジャンルの追加に成功しました'
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      flash.now[:alert] = 'ジャンルの追加に失敗しました'
      render :index
    end
  end

  def show
    @genre = Genre.find(params[:id])
    @novels = @genre.novels
  end

  def edit
    @genre = Genre.find(params[:id])
    @novels = @genre.novels
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = 'ジャンルの編集に成功しました'
      redirect_to admin_genres_path
    else
      flash.now[:alert] = 'ジャンルの編集に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = 'ジャンルの削除に成功しました'
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
