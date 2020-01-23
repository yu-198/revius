class Admins::ArticleController < ApplicationController
	def index
		@article = Article.all
	end

	def new
		@article = Article.new
	end

	def create
	end

	def edit
	end

	def update
	end

	private
		def article_params
			params.require(:article).permit(:name, :introduction)
		end
end
