class Pet < ApplicationRecord

  has_many :contracts, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  belongs_to :user
  validates :photo, presence: true
  validates :name, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader

end
