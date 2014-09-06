class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
			t.string :type
			t.string :address
			t.integer :rentor_id

      t.timestamps
    end
  end
end
