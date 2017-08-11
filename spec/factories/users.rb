require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::name }
    email { Faker::Internet.email }
    password  "test1244"
    password_confirmation  "test1244"
  end
end
