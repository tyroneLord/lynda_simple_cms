class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(acess_login_path)
      return false # halts the before filter
    else
      return true
    end
  end
end
