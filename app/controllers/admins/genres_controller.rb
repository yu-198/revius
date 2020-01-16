class Admins::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
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
  end

  def enable
  	@genre = Genre.find(params[:id])
  	@genre.is_disable == false
  	@genre.save
  	redirect_to admins_genres_path
  end

  def disable
  	@genre = Genre.find(params[:id])
  	@genre.is_disable == true
  	@genre.save
  	redirect_to admins_genres_path
  end

  private
    def genre_params
      params.require(:genre).permit(:name, :id_disable)
    end

end
