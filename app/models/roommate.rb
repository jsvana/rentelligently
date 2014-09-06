class Roommate < ActiveRecord::Base
  belongs_to :user
  belongs_to :roommate, class_name: 'User'
  belongs_to :rental_term
end
