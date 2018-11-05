class Contract < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :date,  uniqueness: { scope: :pet,
    message: "Pet already booked" }
end
