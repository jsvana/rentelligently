class AddRentToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :rent, :decimal, :precision => 6, :scale => 2
  end
end
