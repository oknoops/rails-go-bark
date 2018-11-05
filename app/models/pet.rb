class Pet < ApplicationRecord
  has_many :contracts
  has_many :reviews
  belongs_to :user
  validates :photo, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
