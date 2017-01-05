class ArticlesController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index 
    @articles = Article.all   
  end

  def show
  end

  def new
    @article = Article.new(author: current_user)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
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
    params.require(:article).permit(:title, :body, :status, :description, :topic, :minified_link, {:keywords => []})
  end

  def find_article
    @article = Article.includes(:author, {comments: :commenter}).find(params[:id])
  end

end
