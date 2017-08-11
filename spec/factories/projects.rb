FactoryGirl.define do
  factory :project do
    name { Faker::name }
    description { Faker::Lorem.paragraph }
    status { ['Active', 'Inactive', 'Closed'].sample }
    after(:create) do |project|
      project.customer = FactoryGirl.build(:customer) if project.customer.emtpy?
      project.users = [FactoryGirl.build(:user)] if project.user.empty?
    end
  end
end
