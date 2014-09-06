class AddRoommates < ActiveRecord::Migration
  def change
    create_table :roommates do |t|
      t.integer :user_id
      t.integer :roommate_id
      t.integer :rental_term_id
    end
  end
end
