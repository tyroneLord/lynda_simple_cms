class AdminUserPage < ActiveRecord::Base
  
  belongs_to :admin_user
  belongs_to :page
end
