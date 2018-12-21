require 'rails_helper'

RSpec.describe Role, type: :model do
  subject(:role_example) do
    # Returns a user instance that's not saved
    FactoryBot.build(:role)
  end

  # Test for valid attributes
  it 'is valid if name is given' do
    expect(role_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    role_example.name = nil

    expect(role_example).not_to be_valid
  end

  it 'is not valid if name contains more than 256 characters' do
    role_example.name = 'a' * 257

    expect(role_example).not_to be_valid
  end

  describe "Associations" do
    it 'has many blogs'

    it { should have_many(:privileges) }

    it { should have_many(:users) }
  end
end
