class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties
  has_many :roommates
  has_many :dues

  has_many :posts
  has_many :comments

  has_attached_file :profile, default_url: 'profile.jpg'
  validates_attachment_content_type :profile, :content_type => /\Aimage\/.*\Z/

  def current_property
    end_field = RentalTerm.arel_table[:end_date]
    user_field = RentalTerm.arel_table[:user_id]
    RentalTerm.where(end_field.gteq(Date.current).and(user_field.eq(self.id))).first.try(:property)
  end

  def current_dues
    self.dues.where(paid: false)
  end

  def past_dues
    self.dues.where(paid: true)
  end

  def has_dues?
    self.current_dues.any?
  end

  def current_amount_due
    self.current_dues.pluck(:amount).reduce(:+)
  end

  def has_current_property?
    self.current_property.present?
  end

  def name
    "#{first_name} #{last_name}"
  end
end
