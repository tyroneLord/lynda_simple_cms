class Subject < ActiveRecord::Base
  
  # has_one :page ONE TO ONE RELTIONSHIP
  
  has_many :pages
  
  scope :names, where(:name => "Alicia")
end
