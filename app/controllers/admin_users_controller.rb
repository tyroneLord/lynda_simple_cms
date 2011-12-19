class AdminUsersController < ApplicationController
  layout 'admin'
  # before_filter :confirm_logged_in
  
  def index
    @admin_users = AdminUser.sorted
  end
  
  def show
    @admin_user = AdminUser.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_user }
      format.js
    end
  end
  
  def new
    @admin_user = AdminUser.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_user }
    end
  end
  
  def edit
    @admin_user = AdminUser.find(params[:id])
  end
  
  def create
    @admin_user = AdminUser.new(params[:admin_user])
    
    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to(admin_users_path, :notice => "You have made a user")}
        format.xml  { render :xml => @admin_user, :status => :created, :location => @admin_user }
      else
        format.html {render :action => "new"}
        format.xml  { render :xml => @admin_user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @admin_user = AdminUser.find(params[:id])
    
    respond_to do |format|
      if @admin_user.update_attributes(params[:admin_user])
        format.html {redirect_to(admin_users_path, :notice => "You have updated a user")}
        format.xml  { head :ok }
      else
        format.html {render :action => "edit"}
        format.xml  { head :ok }
      end
    end
  end
  
  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    
    respond_to do |format|
      format.html {redirect_to(admin_users_url)}
      format.xml  { head :ok }
    end
    
  end
  
end
