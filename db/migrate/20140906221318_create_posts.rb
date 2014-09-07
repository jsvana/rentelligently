class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :forum_id
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
