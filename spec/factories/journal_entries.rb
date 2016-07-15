FactoryGirl.define do
  factory :journal_entry do
    content { Faker::Lorem.sentence(256) }

    association :user
  end
end
