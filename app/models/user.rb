class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties
  has_many :roommates

  def current_property
    end_field = RentalTerm.arel_table[:end_date]
    user_field = RentalTerm.arel_table[:user_id]
    RentalTerm.where(end_field.gteq(Date.current).and(user_field.eq(self.id))).first.try(:property)
  end

  def has_current_property?
    self.current_property.present?
  end
end
