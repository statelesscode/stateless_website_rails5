class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'stateless', password: 'code', only: [:destroy]
  before_action :find_article
  def create
    @comment = @article.comments.create(comment_params)
    flash[:notice] = 'Comment was successfully created.'
    redirect_to @article      
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
