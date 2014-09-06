class Property < ActiveRecord::Base
  belongs_to :user

  has_many :rental_terms
  has_many :users, through: :rental_terms
  has_many :issues

  def average_property_rating
    self.rental_terms.pluck(:property_rating).reduce(:+) / self.rental_terms.count
  end

  def average_landlord_rating
    self.rental_terms.pluck(:landlord_rating).reduce(:+) / self.rental_terms.count
  end

  def comments
    self.rental_terms.pluck(:comments)
  end
end
