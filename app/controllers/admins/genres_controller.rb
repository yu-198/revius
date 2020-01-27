class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

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
       flash[:success] = "登録に成功しました"
       redirect_to admins_genres_path
    else
       flash[:danger] = "入力内容を確認してください"
       @genres = Genre.all
       render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
       flash[:success] = "更新に成功しました"
       redirect_to admins_genres_path
    else
       flash[:danger] = "入力内容を確認してください"
      render :edit
    end
  end

  def enable
  	@genre = Genre.find(params[:id])
  	@genre.is_disable = false
  	@genre.save
    flash[:success] = "更新に成功しました"
  	redirect_to admins_genres_path
  end

  def disable
  	@genre = Genre.find(params[:id])
  	@genre.is_disable = true
  	@genre.save
    flash[:danger] = "入力内容を確認してください"
  	redirect_to admins_genres_path
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end

end
