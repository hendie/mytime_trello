require 'rails_helper'

RSpec.describe List, type: :model do
  # Association test
  # ensure List model has a 1:m relationship with the Card model
  it { should have_many(:cards).dependent(:destroy) }
  # ensure List model belongs to the Board model
  it { should belong_to(:board) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
end
