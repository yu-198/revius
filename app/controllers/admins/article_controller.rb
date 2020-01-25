class Admins::ArticleController < ApplicationController
	def index
		@article = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
		 	redirect_to admins_article_index_path
		else
			render :new
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if@article.update(article_params)
		  redirect_to admins_article_index_path
		else
		  render :edit
		end
	end

	private
		def article_params
			params.require(:article).permit(:name, :introduction)
		end
end
