class Property < ActiveRecord::Base
  belongs_to :user

  has_many :rental_terms
  has_many :users, through: :rental_terms
end
