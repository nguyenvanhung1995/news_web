# frozen_string_literal: true

class Post < ApplicationRecord
  is_impressionable
  acts_as_taggable

  belongs_to :category
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :reactions, as: :reactionable

  validates :title, presence: true
  validates :header, presence: true
  validates :content_new, presence: true
  validates :category_id, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
