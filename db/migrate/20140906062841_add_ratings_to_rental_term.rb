class AddRatingsToRentalTerm < ActiveRecord::Migration
  def change
    add_column :rental_terms, :property_rating, :integer
    add_column :rental_terms, :landlord_rating, :integer
  end
end
