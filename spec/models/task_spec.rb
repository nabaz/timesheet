require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { FactoryGirl.build(:task) }

  it { is_expected.to validate_presence_of(:name)}
  it { is_expected.to validate_presence_of(:description)}
end
