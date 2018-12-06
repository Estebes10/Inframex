require 'rails_helper'

RSpec.describe Blob, type: :model do

  subject(:blob_example) do
    # Returns a blob instance that's not saved
    FactoryBot.build(:blob)
  end

  # Test for valid attributes
  it 'is valid if name, description, status and blob_date are given' do
    expect(blob_example).to be_valid
  end

  # Set of tests for each attribute that is required
  it 'is not valid without a name' do
    blob_example.name = nil

    expect(blob_example).not_to be_valid
  end

  it 'is not valid without a description' do
    blob_example.description = nil

    expect(blob_example).not_to be_valid
  end

  it 'is not valid without a status' do
    blob_example.status = nil

    expect(blob_example).not_to be_valid
  end

  it 'is not valid without a date' do
    blob_example.blob_date = nil

    expect(blob_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if the descrition contains more than 1024 characters' do
    blob_example.description = 'a' * 1025

    expect(blob_example).not_to be_valid
  end

  it 'is not valid if the name contains more than 256 characters' do
    blob_example.name = 'a' * 257

    expect(blob_example).not_to be_valid
  end

  # validate uniqueness for name attribute
  it 'is not valid if the name is not unique' do
    # Create a previous record using the same name of blob example and then try
    # to save the blob example
    FactoryBot.create(:blob, name: blob_example.name)

    expect(blob_example).not_to be_valid
  end

  # Set of tests to validate associations
  it 'has many expenses'

  it 'has many pictures'

  it 'belongs to project'

end
