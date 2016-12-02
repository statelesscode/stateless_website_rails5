class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'stateless', password: 'code', except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index 
    @articles = Article.all   
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
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
    if @article.update(article_params)    
      flash[:notice] = 'Article was successfully updated.'
      redirect_to @article
    else
      flash[:alert] = 'Article was not updated due to errors.'
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article was successfully destroyed.'
    redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
