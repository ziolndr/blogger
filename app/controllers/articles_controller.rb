class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])
	end	
	
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Your article '#{@article.title}' has been created."

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Your article '#{@article.title}' has been deleted."

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Your article '#{@article.title}' is updated."

		redirect_to article_path(@article)
	end

	def article_params
		params.require(:article).permit(:title, :body)
	end
end