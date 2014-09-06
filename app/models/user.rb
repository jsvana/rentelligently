class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties

  def current_property
    start_field = RentalTerm.arel_table[:start_date]
    end_field = RentalTerm.arel_table[:end_date]
    RentalTerm.where(start_field.lteq(Date.current).and(end_field.gteq(Date.current))).first.property
  end
end
