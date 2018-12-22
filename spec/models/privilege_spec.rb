require 'rails_helper'

RSpec.describe Privilege, type: :model do
  subject(:privilege_example) do
    # Returns a user instance that's not saved
    FactoryBot.build(:privilege)
  end

  # Test for valid attributes
  it 'is valid if name, str_id, module_name and description are given' do
    expect(privilege_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    privilege_example.name = nil

    expect(privilege_example).not_to be_valid
  end

  it 'is not valid without a code' do
    privilege_example.str_id = nil

    expect(privilege_example).not_to be_valid
  end

  it 'is not valid without a module_name' do
    privilege_example.module_name = nil

    expect(privilege_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if name contains more than 256 characters' do
    privilege_example.name = 'a' * 257

    expect(privilege_example).not_to be_valid
  end

  it 'is not valid if name str_id more than 256 characters' do
    privilege_example.str_id = 'a' * 257

    expect(privilege_example).not_to be_valid
  end

  it 'is not valid if name module_name more than 256 characters' do
    privilege_example.module_name = 'a' * 257

    expect(privilege_example).not_to be_valid
  end

  # validate uniqueness for str_id attribute
  it 'is not valid if the email is not unique' do
    FactoryBot.create(:privilege, str_id: privilege_example.str_id)

    expect(privilege_example).not_to be_valid
  end

  it 'has many roles' do
    should have_many(:roles)
  end
end
