require 'rails_helper'

RSpec.describe Card, type: :model do
  # Association test
  # ensure an Card record belongs to a single List record
  it { should belong_to(:list) }
  # Validation test
  # ensure column title is present before saving
  it { should validate_presence_of(:title) }
end
