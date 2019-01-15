require 'rails_helper'

RSpec.describe Job, type: :model do

  before(:each)do
    @project = FactoryBot.create(:project)
    @category = FactoryBot.create(:category)
    @blog = FactoryBot.create(:blog, project_id: @project.id)
    @concept = FactoryBot.create(:concept, category_id: @category.id, project_id: @project.id)
  end

  subject(:job_example) do
    # Returns a blog instance that's not saved
    FactoryBot.build(
      :job,
      blog_id: @blog.id,
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
