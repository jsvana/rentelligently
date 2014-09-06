class Property < ActiveRecord::Base
  belongs_to :user

  has_many :rental_terms
  has_many :users, through: :rental_terms
  has_many :issues

  has_attached_file :image, default_url: 'house_placeholder.jpg'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def current_term
    self.rental_terms.order(end_date: :desc).first
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
