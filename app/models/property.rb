class Property < ActiveRecord::Base
  belongs_to :user

  has_many :rental_terms
  has_many :users, through: :rental_terms
  has_many :issues
  has_many :utilities

	validates :address, :landlord_name, :rent, presence: true

  has_attached_file :image, default_url: 'house_placeholder.jpg'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def current_occupants
    end_field = RentalTerm.arel_table[:end_date]
    property_field = RentalTerm.arel_table[:property_id]
    RentalTerm.where(end_field.gteq(Date.current).and(property_field.eq(self.id))).map(&:user).uniq
  end

  def is_current_occupant?(user)
    self.current_occupants.include?(user)
  end

  def current_term_for(user)
    self.rental_terms.where(user: user).order(end_date: :desc).first
  end

  def has_terms?
    self.rental_terms.count > 0
  end

  def average_property_rating
    self.rental_terms.pluck(:property_rating).reduce(:+) / self.rental_terms.count
  end

  def average_landlord_rating
    self.rental_terms.pluck(:landlord_rating).reduce(:+) / self.rental_terms.count
  end

  def comments
    self.rental_terms.pluck(:comments)
  end

  def fixed_issues
    self.issues.where(fixed: true)
  end

  def outstanding_issues
    self.issues.where(fixed: false)
  end
end
