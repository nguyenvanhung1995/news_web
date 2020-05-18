# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactionable, polymorphic: true

  enum action: %i[like dislike]
end
