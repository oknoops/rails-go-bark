class Review < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :rating, presence: true
  validates_numericality_of :rating, greater_than_or_equal_to: 0, less_than_or_equal_to: 5
end
