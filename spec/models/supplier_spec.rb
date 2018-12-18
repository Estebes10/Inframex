require 'rails_helper'

RSpec.describe Supplier, type: :model do
  subject(:supplier_example) do
    # Returns a blog instance that's not saved
    FactoryBot.build(:supplier)
  end

  # Test for valid attributes
  it 'is valid if name is given' do
    expect(supplier_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    supplier_example.name = nil

    expect(supplier_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if the name contains more than 256 characters' do
    supplier_example.name = 'a' * 257

    expect(supplier_example).not_to be_valid
  end

  # validate uniqueness for name attribute
  it 'is not valid if the name is not unique' do
    # Create a previous record using the same name of blog example and then try
    # to save the blog example
    FactoryBot.create(:supplier, name: supplier_example.name)

    expect(supplier_example).not_to be_valid
  end

  # Set of tests to validate associations
  it 'has many expenses' do
    should have_many(:expenses)
  end
end
