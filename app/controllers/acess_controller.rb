class AcessController < ApplicationController
  
  def index
  end
  def menu
  end

  def login
    # login form
    
  end
  
  def attempt_login
    @authorized_user = AdminUser.authenticate(:params[:username], :params[:password])
    if @authorized_user
      flash[:notice] = "thank you for logging in"
      redirect_to(acess_menu_path)
    else
      flash[:notice] = "fuck you"
      redirect_to(acess_login_path)
    end
  end
  
  def logout
    flash[:notice] = "bye"
    redirect_to(acess_login_path)
  end


end
