class UsersController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_user, only: [:show, :edit, :update, :destroy, :email_subscribe]

  def show

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
    params.require(:user).permit(:username)
  end

  def find_user
    @user = User.find(params[:id])
  end


end
