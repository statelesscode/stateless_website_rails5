class ArticlesController < ApplicationController

  def index    
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save    
      flash[:notice] = 'Article was successfully created.'
      redirect_to @article
    else
      flash[:alert] = 'Article was not created due to errors.'
      render :new
    end
  end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
