class RentalTerm < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  has_many :roommates

	validates :user_id, :property_id, :start_date, :end_date, :property_rating,
		:landlord_rating, presence: true
  validates_numericality_of :property_rating, in: 1..5
  validates_numericality_of :landlord_rating, in: 1..5
	#validates_date :start_date, before: :end_date
  validate :end_after_start

private

  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
