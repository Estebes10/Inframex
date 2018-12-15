require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user_example) do
    # Returns a user instance that's not saved
    FactoryBot.build(:user)
  end

  # Test for valid attributes
  it 'is valid if name, lastName, phone, email, birthday, password and status are given' do
    expect(user_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    user_example.name = nil

    expect(user_example).not_to be_valid
  end

  it 'is not valid without a lastname' do
    user_example.lastName = nil

    expect(user_example).not_to be_valid
  end

  it 'is not valid without a status' do
    user_example.status = nil

    expect(user_example).not_to be_valid
  end

  it 'is not valid without an email' do
    user_example.email = nil

    expect(user_example).not_to be_valid
  end

  it 'is not valid without a password' do
    user_example.password = nil

    expect(user_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if name contains more than 128 characters' do
    user_example.name = 'a' * 129

    expect(user_example).not_to be_valid
  end

  it 'is not valid if the lastname contains more than 128 characters' do
    user_example.lastName = 'a' * 129

    expect(user_example).not_to be_valid
  end

  it 'is not valid if password contains more than 64 characters' do
    user_example.password = 'a' * 65

    expect(user_example).not_to be_valid
  end

  it 'is not valid if password contains less than 6 characters' do
    user_example.password = 'a' * 5

    expect(user_example).not_to be_valid
  end

  it 'is not valid if the email contains more than 128 characters' do
    user_example.email = 'a' * 129

    expect(user_example).not_to be_valid
  end

  it 'is not valid if phone number contains more than 20 characters' do
    user_example.phone = 'a' * 21

    expect(user_example).not_to be_valid
  end

  # validate uniqueness for email attribute
 it 'is not valid if the email is not unique' do
   # Create a previous record using the same email of user example and then try
   # to save the user example
   FactoryBot.create(:user, email: user_example.email)

   expect(user_example).not_to be_valid
 end

  # Set of tests to validate associations
  it 'belongs to role'

  it 'has many projects'
end
