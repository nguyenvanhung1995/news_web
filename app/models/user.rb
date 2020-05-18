# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :posts

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  enum role: %i[user author admin]

  mount_uploader :avatar, AvatarUploader
end
