FactoryGirl.define do
  factory :comment do
    association :user
    association :journal_entry
    body { Faker::Lorem.sentence(25) }
  end
end
