class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html do
        if user_signed_in? 
          redirect_to root_url, :alert => exception.message
        else
          redirect_to new_user_session_path, :alert => exception.message
        end
      end 
    end
  end  
end
