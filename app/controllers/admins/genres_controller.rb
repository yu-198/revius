class Admins::GenresController < ApplicationController
  def index
  end

  def edit
  end

  def create
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

end
