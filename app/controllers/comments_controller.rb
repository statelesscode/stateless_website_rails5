class CommentsController < ApplicationController
  before_action :find_article
  def create
    if @article.comments.create(comment_params)
      flash[:notice] = 'Comment was successfully created.'
      redirect_to @article      
    else
      flash[:alert] = 'Comment was not created due to errors.'
      render 'articles/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment was successfully destroyed.'
    redirect_to @article
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end


  def find_article
    @article = Article.find(params[:article_id])
  end  
end
