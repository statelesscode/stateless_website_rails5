class ArticlesController < ApplicationController

  def index
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save    
      flash[:notice] = 'Article was successfully created.'
      redirect_to @article
    end
  end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
