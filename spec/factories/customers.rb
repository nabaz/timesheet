require 'faker'

FactoryGirl.define do
  factory :customer do
    name { Faker::name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    status { ['Active', 'Inactive', 'Closed'].sample }
  end
end
