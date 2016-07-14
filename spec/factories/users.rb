FactoryGirl.define do
  factory :user do
    username { Faker::Name.first_name  }
    email { Faker::Internet.email }
    password 'test1234'
    password_confirmation 'test1234'
  end
end
