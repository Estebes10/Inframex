require 'rails_helper'

RSpec.describe Job, type: :model do

  subject(:job_example) do
    # Returns a blog instance that's not saved
    FactoryBot.build(:job)
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

  # Set of tests to validate attribute length
  it 'is not valid if the descrition contains more than 1024 characters' do
    job_example.name = 'a' * 257

    expect(job_example).not_to be_valid
  end

  # Set of tests to validate associations
  it 'belongs to blog' do
    should belong_to(:blog)
  end

end
