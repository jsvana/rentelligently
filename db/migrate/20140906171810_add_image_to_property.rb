class AddImageToProperty < ActiveRecord::Migration
  def self.up
    add_attachment :properties, :image
  end

  def self.down
    remove_attachment :properties, :image
  end
end
