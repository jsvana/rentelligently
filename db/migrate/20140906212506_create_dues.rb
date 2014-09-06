class CreateDues < ActiveRecord::Migration
  def change
    create_table :dues do |t|
      t.integer :user_id
      t.integer :utility_id
      t.decimal :amount, precision: 6, scale: 2
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
