class Pet < ApplicationRecord

  has_many :contracts, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  belongs_to :user
  validates_presence_of :photo, :message => "Your pet needs a picture"
  validates_presence_of :name, :message => "Your pet doesn't have a name"
  validates_presence_of :price, :message => "Your pet doesn't have a price/day"
  validates_presence_of :specie, :message => "Your pet needs a specie"
  mount_uploader :photo, PhotoUploader


  def average
    total = self.reviews.map do
      |review| review.rating
    end
    if total.size == 0
      return 0
    else
      return total.sum / total.size
    end
  end

  def self.sorted_by_average
    Pet.all.sort_by(&:average).reverse!
  end
end
