require 'rails_helper'

RSpec.describe Concept, type: :model do

  before(:each)do
    @project = FactoryBot.create(:project)
    @category = FactoryBot.create(:category)
  end

  subject(:concept_example) do
    # Returns a blog instance that's not saved
    FactoryBot.build(:concept, project_id: @project.id, category_id: @category.id, weight: 99.round(2))
  end

  # Test for valid attributes
  it 'is valid if needed attributes are given' do
    expect(concept_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a code' do
    concept_example.code = nil

    expect(concept_example).not_to be_valid
  end

  it 'is not valid without a description' do
    concept_example.description = nil

    expect(concept_example).not_to be_valid
  end

  it 'is not valid without a unity' do
    concept_example.unity = nil

    expect(concept_example).not_to be_valid
  end

  it 'is not valid without unit_price' do
    concept_example.unit_price = -0.53

    expect(concept_example).not_to be_valid
  end

  it 'is not valid without quantity' do
    concept_example.quantity = nil

    expect(concept_example).not_to be_valid
  end

  it 'is not valid without weight' do
    concept_example.weight = nil

    expect(concept_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if the code contains more than 6 characters' do
    concept_example.code = 'a' * 7

    expect(concept_example).not_to be_valid
  end

  it 'is not valid if description contains more than 1024 characters' do
    concept_example.description = 'a' * 1025

    expect(concept_example).not_to be_valid
  end

  it 'is not valid if quantity is less or equal than 0' do
    concept_example.quantity = 0

    expect(concept_example).not_to be_valid
  end

  it 'is not valid if unit price is less or equal than 0' do
    concept_example.unit_price = 0

    expect(concept_example).not_to be_valid
  end

  it 'is not valid if weight is less or equal than 0' do
    concept_example.weight = 0

    expect(concept_example).not_to be_valid
  end

  # Set of tests to validate associations
  it 'belongs to category' do
    should belong_to(:category)
  end

  it 'belongs to project' do
    should belong_to(:project)
  end

  it 'has many expenses' do
    should have_many(:expenses)
  end

  it 'has many jobs' do
    should have_many(:jobs)
  end


end
