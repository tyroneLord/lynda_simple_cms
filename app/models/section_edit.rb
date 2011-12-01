class SectionEdit < ActiveRecord::Base
  
  belongs_to :section
  belongs_to :admin_user
end
