require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject(:expense_example) do
    # Returns a blog instance that's not saved
    FactoryBot.build(:expense)
  end

  # Test for valid attributes
  it 'is valid if needed attributes are given' do
    expect(expense_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    expense_example.name = nil

    expect(expense_example).not_to be_valid
  end

  it 'is not valid without a date' do
    expense_example.date = nil

    expect(expense_example).not_to be_valid
  end

  it 'is not valid without a unity' do
    expense_example.unity = nil

    expect(expense_example).not_to be_valid
  end

  it 'is not valid without unit_price' do
    expense_example.unit_price = nil

    expect(expense_example).not_to be_valid
  end

  it 'is not valid without quantity' do
    expense_example.quantity = nil

    expect(expense_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if the name contains more than 256 characters' do
    expense_example.name = 'a' * 257

    expect(expense_example).not_to be_valid
  end

  it 'is not valid if the unity contains more than 256 characters' do
    expense_example.name = 'a' * 257

    expect(expense_example).not_to be_valid
  end

  # Set of tests to validate associations
  it 'belongs to subcategory' do
    should belong_to(:subcategory)
  end

  it 'belongs to supplier' do
    should belong_to(:supplier)
  end

end