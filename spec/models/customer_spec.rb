require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { FactoryGirl.build(:customer) }

  it { is_expected.to validate_presence_of(:name)}
  it { is_expected.to validate_presence_of(:email)}
  it { is_expected.to validate_presence_of(:phone)}
  it { is_expected.to validate_inclusion_of(:status).in_array(['Active', 'Inactive', 'Closed'])}
end
