class UsersController < ApplicationController
  load_and_authorize_resource 
  before_action :find_user, only: [:show, :edit, :update, :destroy, :email_subscribe]

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)    
      flash[:notice] = 'User profile was successfully updated.'
      redirect_to @user
    else
      flash[:alert] = 'User profile was not updated due to errors.'
      render :edit
    end    
  end

  # other routes
  def email_subscribe
    @user.update(email_subscriber: true)
    # TODO: send welcome email here
    flash[:notice] = "Thank you for joining the Stateless Code email distibution!"
    redirect_to @user
  end


  private
  def user_params
    params.require(:user).permit(:username, :avatar)
  end

  def find_user
    @user = User.find(params[:id])
  end


end
