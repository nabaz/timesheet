require 'faker'
FactoryGirl.define do
  factory :time_entry do
    title { Faker::Lorem.sentence }
    start_time { Faker::Time.between(DateTime.now - 1, DateTime.now)  }
    end_time { Faker::Time.between(DateTime.now + 1, DateTime.now)  }
    description { Faker::Lorem.paragraph  }

    after(:create) do |te|
      te.task = FactoryGirl.build(:task) if te.task.empty?
      te.user = FactoryGirl.build(:user) if te.user.empty?
    end

  end
end
