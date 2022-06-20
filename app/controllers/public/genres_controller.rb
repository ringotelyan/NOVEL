class Public::GenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @novels = @genre.novels
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    flash[:notice] = 'ジャンルの追加に成功しました'
    redirect_to public_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
