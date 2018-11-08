class User < ApplicationRecord
  has_many :pets, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  has_many :contracts, dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :message => "We need your first name"
  validates_presence_of :last_name, :message => "We need your first last name"
  mount_uploader :avatar, AvatarUploader
end
