class CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_commentable
  
  def create
    @comment = Comment.create(comment_params)
    @comment.commenter = current_user
    flash[:notice] = 'Comment was successfully created.'
    redirect_to @comment      
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment was successfully destroyed.'
    redirect_to @commentable
  end

  private
  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body)
  end


  def find_article
    commentable_type = params[:commentable_type]
    @commentable = commentable_type.constantize.find(params[:commentable_id])
  end  
end
