class AdminUsersController < ApplicationController
  layout 'admin'
  # before_filter :confirm_logged_in
  
  def index
    @admin_users = AdminUser.all
  end
end
