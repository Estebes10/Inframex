require 'rails_helper'

RSpec.describe Blog, type: :model do

  subject(:blog_example) do
    # Returns a blog instance that's not saved
    FactoryBot.build(:blog)
  end

  # Test for valid attributes
  it 'is valid if name, description, status and blog_date are given' do
    expect(blog_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    blog_example.name = nil

    expect(blog_example).not_to be_valid
  end

  it 'is valid without a description' do
    blog_example.description = nil

    expect(blog_example).to be_valid
  end

  it 'is not valid without a status' do
    blog_example.status = nil

    expect(blog_example).not_to be_valid
  end

  it 'is not valid without a date' do
    blog_example.date = nil

    expect(blog_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if the descrition contains more than 1024 characters' do
    blog_example.description = 'a' * 1025

    expect(blog_example).not_to be_valid
  end

  it 'is not valid if the name contains more than 256 characters' do
    blog_example.name = 'a' * 257

    expect(blog_example).not_to be_valid
  end

  # validate uniqueness for name attribute
  it 'is not valid if the name is not unique' do
    # Create a previous record using the same name of blog example and then try
    # to save the blog example
    FactoryBot.create(:blog, name: blog_example.name)

    expect(blog_example).not_to be_valid
  end

  # Set of tests to validate associations
  it 'has many expenses'

  it 'has many pictures'

  it 'belongs to project' do
    should belong_to(:project)
  end

  it 'has many jobs' do
    should have_many(:jobs)
  end

end
