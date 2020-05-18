# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_many :reactions, as: :reactionable

  validates :content, presence: true

  def children
    post.comments.where(parent_id: id)
  end
end
