class Review < ApplicationRecord
  belongs_to :pet
  belongs_to :user
end
