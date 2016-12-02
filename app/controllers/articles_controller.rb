class ArticlesController < ApplicationController

  def index 
    @articles = Article.all   
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
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

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)    
      flash[:notice] = 'Article was successfully updated.'
      redirect_to @article
    else
      flash[:alert] = 'Article was not updated due to errors.'
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = 'Article was successfully destroyed.'
    redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
