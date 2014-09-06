class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :properties

  def self.rentors
    User.where(user_type: 'rentor')
  end

  def self.rentees
    User.where(user_type: 'rentee')
  end
end
