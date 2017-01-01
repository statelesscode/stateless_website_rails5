class CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_commentable, only: [:create]
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all.order(created_at: :desc)
  end
  
  def show
  end

  def edit
    @commentable = @comment.commentable
  end

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

  def update
    if @comment.update(comment_params)    
      flash[:notice] = 'Comment was successfully updated.'
      redirect_to @comment
    else
      flash[:alert] = 'Comment was not updated due to errors.'
      render :edit
    end
  end

  def destroy
    @commentable = @comment.commentable
    @comment.destroy
    flash[:notice] = 'Comment was successfully destroyed.'
    redirect_to @commentable
  end

  private
  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end  
end
