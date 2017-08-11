require 'rails_helper'

RSpec.describe TimeEntry, type: :model do
  subject { FactoryGirl.build(:time_entry) }

  it {is_expected.to validate_presence_of(:title)}
  it {is_expected.to validate_presence_of(:description)}
end
