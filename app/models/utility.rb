class Utility < ActiveRecord::Base
  belongs_to :property

  has_many :dues

  def per_occupant_cost
    self.cost / self.property.current_occupants.count
  end
end
