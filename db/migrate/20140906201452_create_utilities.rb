class CreateUtilities < ActiveRecord::Migration
  def change
    create_table :utilities do |t|
      t.integer :property_id
      t.string :provider
      t.date :due_by
      t.decimal :cost, precision: 6, scale: 2

      t.timestamps
    end
  end
end
