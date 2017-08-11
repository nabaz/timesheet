require 'faker'
FactoryGirl.define do
  factory :task do
    name { Faker::name }
    description { Faker::Lorem.paragraph }
    status { ['Active', 'Inactive', 'Closed'].sample }
    after(:create) do |task|
      task.project = FactoryGirl.build(:project) if task.project.emtpy?
      task.user =  FactoryGirl.build(:user) if task.user.empty?
    end
  end
end
