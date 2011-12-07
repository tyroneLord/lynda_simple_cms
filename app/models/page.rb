class Page < ActiveRecord::Base
  
  has_many :admin_user_pages
  has_many :admin_users, through: :admin_user_pages
  
  # belongs_to :subject BECAUSE THS HAS THE BELONGS TO THE PAGE TABLE SHOULD HAVE A FORIEGN KEY FOR THE SUBJECT ONE TO ONE RELTIONSHIP
  
  belongs_to :subject # many to many
  has_many :sections #many to many
  
  validates_presence_of :name, :message => "hell nawl"
  validates_length_of :name, :maximum => 255
  
end
