require 'open-uri'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  TEMP_EMAIL = 'change@me.com'
  TEMP_EMAIL_REGEX = /change@me.com/

  has_many :properties
  has_many :roommates
  has_many :dues

  has_many :posts
  has_many :comments

  has_attached_file :profile, default_url: 'profile.jpg'
  validates_attachment_content_type :profile, :content_type => /\Aimage\/.*\Z/

  devise :omniauthable

  def self.find_for_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(first_name:auth.extra.raw_info.first_name,
                           last_name:auth.extra.raw_info.last_name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email.blank? ? TEMP_EMAIL : auth.info.email,
                           password:Devise.friendly_token[0,20],
                           token: auth.credentials.token,
                          )
      end
    end
    user
  end

  def recent_payments
    uri = URI("https://api.venmo.com/v1/payments?access_token=#{self.token}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.body
  end

  def pay_user(user, note, amount)
    uri = URI('https://api.venmo.com/v1/payments')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})

    data = {
      access_token: self.token,
      user_id: user.uid,
      node: note,
      amount: amount
    }

    request.body = data.to_json

    http.request(request)
  end

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

  def display_name
    if first_name
      first_name
    else
      email
    end
  end
end
