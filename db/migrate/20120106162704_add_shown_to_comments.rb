class AddShownToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :shown, :boolean, :null=>false, :default=>false
  end

  def self.down
    remove_column :comments, :shown
  end
end
