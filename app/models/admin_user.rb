class AdminUser < ActiveRecord::Base
  
  require 'digest/sha1'
  
  has_many :admin_user_pages
  has_many :pages, through: :admin_user_pages
  has_many :section_edits
  has_many :sections, through: :section_edits
  scope :named, lambda {|first, last| where(:first_name => first, :last_name => last)}
  # TO USE THE ABOVE SCOPE WE WOULD DO THIS IN CONSOLE 
  # AdminUser.name("tyrone", "gaylord")
  
  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} width #{Time.now} to make salt")
  end
  
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  # THIS IS HOW TO HASH SHA1 ENCRYPTION BEFORE YOU SALT THE PASSWORD AS WELL
  # def self.hash(password="")
  #   Digest::SHA1.hexdigest(password)
  # end
  
end
