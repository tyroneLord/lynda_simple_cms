class Subject < ActiveRecord::Base
  
  # has_one :page ONE TO ONE RELTIONSHIP
  
  has_many :pages
  
  scope :names, where(:name => "Alicia")
  
  validates_presence_of :name, :message => "hell nawl"
  validates_length_of :name, :maximum => 255
end
