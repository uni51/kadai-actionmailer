class User < ApplicationRecord
  mount_uploader :icon, ImageUploader

  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :icon, presence: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog
end
