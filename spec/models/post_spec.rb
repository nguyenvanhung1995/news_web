# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:header) }
  it { should validate_presence_of(:content_new) }
  it { should validate_presence_of(:category_id) }
end
