require 'rails_helper'

RSpec.describe Subcategory, type: :model do
  subject(:subcategory_example) do
    # Returns a blog instance that's not saved
    FactoryBot.build(:subcategory)
  end

  # Test for valid attributes
  it 'is valid if name is given' do
    expect(subcategory_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    subcategory_example.name = nil

    expect(subcategory_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if the name contains more than 256 characters' do
    subcategory_example.name = 'a' * 257

    expect(subcategory_example).not_to be_valid
  end

  # validate uniqueness for name attribute
  it 'is not valid if the name is not unique' do
    # Create a previous record using the same name of blog example and then try
    # to save the blog example
    FactoryBot.create(:subcategory, name: subcategory_example.name)

    expect(subcategory_example).not_to be_valid
  end

  # Set of tests to validate associations
  it 'has many expenses' do
    should have_many(:expenses)
  end
end
