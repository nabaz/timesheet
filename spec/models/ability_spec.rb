require 'rails_helper'
require "cancan/matchers"

RSpec.describe Ability, type: :model do
  subject { FactoryGirl.build(:user) }

  it "admin" do
    user = FactoryGirl.build(:user, level: 'admin')
    ability = Ability.new(user)
    expect(ability).to be_able_to(:destroy, Project.new(:users => [user]))
  end

  it "user" do
    user = FactoryGirl.build(:user, level: 'user')

    ability = Ability.new(user)
    expect(ability).to_not be_able_to(:destroy, Project.new(:users => [user]))
    expect(ability).to be_able_to(:create, TimeEntry.new(:user => user))
  end

end
