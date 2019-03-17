class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def new
    @article = Article.new
  end

  def create
    if current_user.admin
      @article = Article.new(article_params)

      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    end
  end
  def update
    if current_user.admin
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
  end
  def show
    @article = Article.find(params[:id])
  end
  def destroy
    if current_user.admin
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to calc_articles_path
    end
    end

  def edit
    @article = Article.find(params[:id])
  end
end
private
def article_params
  params.require(:article).permit(:title, :body)
end