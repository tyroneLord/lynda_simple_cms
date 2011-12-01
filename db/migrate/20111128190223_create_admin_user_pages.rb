class CreateAdminUserPages < ActiveRecord::Migration
  def self.up
    create_table :admin_user_pages, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "page_id"

    end
  end

  def self.down
    drop_table :admin_user_pages
  end
end
