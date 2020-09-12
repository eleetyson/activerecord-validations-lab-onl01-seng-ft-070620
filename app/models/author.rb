class Author < ActiveRecord::Base
  # all authors have a unique name and a ten digit number
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: {is: 10}
end
