require 'rails_helper'

RSpec.describe Project, type: :model do
  subject { FactoryGirl.build(:project) }

  it { is_expected.to validate_presence_of(:name)}
  it { is_expected.to have_many(:users).through(:project_user_assignements)}

end
