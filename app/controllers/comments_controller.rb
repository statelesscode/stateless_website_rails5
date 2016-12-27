class CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_commentable
  
  def create    
    @comment = @commentable.comments.new(comment_params)
    @comment.commenter = current_user
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to @commentable
    else
      flash[:notice] = 'Comment not created due to error.'
    end      
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

  def find_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end  
end
