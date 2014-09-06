class RentalTerm < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  has_many :roommates

  validates_numericality_of :property_rating, in: 1..5
  validates_numericality_of :landlord_rating, in: 1..5
end
