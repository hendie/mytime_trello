FactoryGirl.define do
  factory :list do
    name { Faker::Book.genre }
    board_id nil
  end
end
