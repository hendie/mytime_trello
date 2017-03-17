FactoryGirl.define do
  factory :card do
    title { Faker::Hipster.sentence }
    list_id nil
  end
end
