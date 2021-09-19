class Course < ApplicationRecord
  validates :short_name, presence: true, length: {maximum: 5}
  validates :name, presence: true, length: {minimum: 4, maximum: 50}
  validates :description, presence: true, length: {minimum: 12, maximum: 300}


end
