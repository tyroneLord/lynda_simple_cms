class AcessController < ApplicationController
  layout 'admin'
  
  def index
  end
  def menu
  end

  def login

  end
  
  def attempt_login
    @authorized_user = AdminUser.authenticate(params[:username], params[:password])
      if @authorized_user
        flash[:notice] = "thank you for logging in"
        redirect_to(admin_path)
      else
        flash[:notice] = "fuck you"
        render "login"
      end
  end
  
  def logout
    flash[:notice] = "bye"
    redirect_to(acess_login_path)
  end


end
