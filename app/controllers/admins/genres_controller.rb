class Admins::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
       redirect_to admins_genres_path
    else
       render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       redirect_to admins_genres_path
    else
      render :edit
    end
  end

  def enable
  	@genre = Genre.find(params[:id])
  	@genre.is_disable = false
  	@genre.save
  	redirect_to admins_genres_path
  end

  def disable
  	@genre = Genre.find(params[:id])
  	@genre.is_disable = true
  	@genre.save
  	redirect_to admins_genres_path
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end

end
