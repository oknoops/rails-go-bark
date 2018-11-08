class Review < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates_presence_of :rating, :message => "We need a rating"
  validates :user, uniqueness: { scope: :pet,
    message: "You can only review a pet once" }
  validates_numericality_of :rating, greater_than_or_equal_to: 0, less_than_or_equal_to: 5, :message => "Rating needs to be betwen 0 and 5"
#   validate :had_a_contract

# def had_a_contract
#   review_pet = Review.joins(:pet).where(pets: {id: self.pet.id})
#   reviews = Review.joins(:user).wher

# end

end
