class Public::GenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to public_genres_path
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to public_genres_path
    else
      render 'edit'
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end