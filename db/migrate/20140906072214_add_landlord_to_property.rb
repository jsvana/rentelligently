class AddLandlordToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :landlord_name, :string
    add_column :properties, :landlord_phone, :string
    add_column :properties, :landlord_email, :string
  end
end
