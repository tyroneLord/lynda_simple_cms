class AdminUser < ActiveRecord::Base
  
  require 'digest/sha1'
  
  has_many :admin_user_pages
  has_many :pages, through: :admin_user_pages
  has_many :section_edits
  has_many :sections, through: :section_edits
  scope :sorted, order("admin_users.last_name ASC")
  scope :named, lambda {|first, last| where(:first_name => first, :last_name => last)}
  # TO USE THE ABOVE SCOPE WE WOULD DO THIS IN CONSOLE 
  # AdminUser.name("tyrone", "gaylord")
  validates_length_of :password, :within => 5..25, :on => :create
  attr_accessor :password
  before_save :create_hashed_password
  after_save :clear_password
  
  def self.authenticate(username="", password="")
    user = AdminUser.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end
  
  def password_match?(password="")
    hashed_password == AdminUser.hash_with_salt(password, salt)
  end
 
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
    
    def name 
      "#{first_name} #{last_name}"
    end
  
  private
    
    def create_hashed_password
      unless password.blank?
        self.salt = AdminUser.make_salt(username) if salt.blank?
        self.hashed_password = AdminUser.hash_with_salt(password, salt)
      end
    end
    
    def clear_password
      self.password = nil
    end
    
  
end
