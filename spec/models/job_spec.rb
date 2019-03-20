require 'rails_helper'

RSpec.describe Job, type: :model do

  before(:each)do
    @project = FactoryBot.create(:project)
    @category = FactoryBot.create(:category)
    @concept = FactoryBot.create(:concept, category_id: @category.id, project_id: @project.id)
  end

  subject(:job_example) do
    # Returns a blog instance that's not saved
    FactoryBot.build(
      :job,
      quantity: Faker::Number.decimal(2,2),
      unity: ["m2", "kg", "L", "m"].sample,
      weight: Faker::Number.decimal(2,2),
      concept_id: @concept.id
    )
  end

  # Test for valid attributes
  it 'is valid if name, description, status and blog_date are given' do
    expect(job_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    job_example.name = nil

    expect(job_example).not_to be_valid
  end

  it 'is not valid without a quantity' do
    job_example.quantity = nil

    expect(job_example).not_to be_valid
  end

  it 'is not valid without a unity' do
    job_example.quantity = nil

    expect(job_example).not_to be_valid
  end

  it 'is not valid without a weight' do
    job_example.weight = nil

    expect(job_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if the name contains more than 256 characters' do
    job_example.name = 'a' * 257

    expect(job_example).not_to be_valid
  end

  it 'is not valid if the unity is less than 0' do
    job_example.quantity = -1

    expect(job_example).not_to be_valid
  end

  it 'is not valid if the weight is less than 0' do
    job_example.weight = -1

    expect(job_example).not_to be_valid
  end

  it 'is not valid if the weight is greater than 100' do
    job_example.weight = 101

    expect(job_example).not_to be_valid
  end

  # Set of tests to validate associations
  it 'belongs to concept' do
    should belong_to(:concept)
  end

  it 'has many job progress' do
    should have_many(:job_progress)
  end

end
