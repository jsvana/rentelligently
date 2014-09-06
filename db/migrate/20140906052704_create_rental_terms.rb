class CreateRentalTerms < ActiveRecord::Migration
  def change
    create_table :rental_terms do |t|
      t.integer :user_id
      t.integer :property_id
      t.date :start_date
      t.date :end_date
      t.text :comments

      t.timestamps
    end
  end
end