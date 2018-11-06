class User < ApplicationRecord
  has_many :pets
  has_many :reviews
  has_many :contracts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :last_name, presence: true
  validates :photo, presence: true
  mount_uploader :avatar, AvatarUploader
end
