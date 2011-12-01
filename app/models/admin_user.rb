class AdminUser < ActiveRecord::Base
  
  has_many :admin_user_pages
  has_many :pages, through: :admin_user_pages
  has_many :section_edits
  has_many :sections, through: :section_edits
  scope :named, lambda {|first, last| where(:first_name => first, :last_name => last)}
  # TO USE THE ABOVE SCOPE WE WOULD DO THIS IN CONSOLE 
  # AdminUser.name("tyrone", "gaylord")
  
end
