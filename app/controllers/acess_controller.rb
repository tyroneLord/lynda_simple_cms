class AcessController < ApplicationController
  layout 'admin'
  
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
  end
  def menu
  end

  def login

  end
  
  def attempt_login
    @authorized_user = AdminUser.authenticate(params[:username], params[:password])
      if @authorized_user
        session[:user_id] = @authorized_user.id
        session[:username] = @authorized_user.username
        flash[:notice] = "thank you for logging in"
        redirect_to(admin_path)
      else
        flash[:notice] = "fuck you"
        render "login"
      end
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "bye"
    redirect_to(acess_login_path)
  end
  
  # private
  # def confirm_logged_in
  #   unless session[:user_id]
  #     flash[:notice] = "Please log in."
  #     redirect_to(acess_login_path)
  #     return false # halts the before filter
  #   else
  #     return true
  #   end
  # end


end
