require 'rails_helper'

RSpec.describe Board, type: :model do
  # Association test
  # ensure Board model has a 1:m relationship with the List model
  it { should have_many(:lists).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
end
