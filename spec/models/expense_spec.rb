require 'rails_helper'

RSpec.describe Expense, type: :model do

  before(:each)do
    @project = FactoryBot.create(:project)
    @category = FactoryBot.create(:category)
    @blog = FactoryBot.create(:blog, project_id: @project.id)
    @concept = FactoryBot.create(:concept, category_id: @category.id, project_id: @project.id)
    @supplier = FactoryBot.create(:supplier)
    @subcategory = FactoryBot.create(:subcategory)
  end

  subject(:expense_example) do
    # Returns a blog instance that's not saved
    FactoryBot.build(
      :expense,
      supplier_id: @supplier.id,
      subcategory_id: @subcategory.id,
      blog_id: @blog.id,
      concept_id: @concept.id
    )
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
    expense_example.unit_price = -0.53

    expect(expense_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if the name contains more than 256 characters' do
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

  it 'belongs to concept' do
    should belong_to(:concept)
  end

  it 'belongs to blog' do
    should belong_to(:blog)
  end

end
