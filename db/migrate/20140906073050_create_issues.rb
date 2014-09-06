class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :property_id
      t.text :description
      t.boolean :fixed, default: false

      t.timestamps
    end
  end
end
