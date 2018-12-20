require 'rails_helper'

RSpec.describe Project, type: :model do
  subject(:project_example) do
    # Returns a user instance that's not saved
    FactoryBot.build(:project)
  end

  # Test for valid attributes
  it 'is valid if name, code, start_date, due_date, status, client and address are given' do
    expect(project_example).to be_valid
  end

  it 'is not valid without a name' do
    project_example.name = nil

    expect(project_example).not_to be_valid
  end

  # Set of tests to validate attribute length
  it 'is not valid if name contains more than 256 characters' do
    project_example.name = 'a' * 257

    expect(project_example).not_to be_valid
  end

  it 'is not valid if code contains more than 32 characters' do
    project_example.code = 'a' * 33

    expect(project_example).not_to be_valid
  end

  it 'is not valid if address contains more than 256 characters' do
    project_example.address = 'a' * 257

    expect(project_example).not_to be_valid
  end

  it 'is not valid if client contains more than 256 characters' do
    project_example.client = 'a' * 257

    expect(project_example).not_to be_valid
  end

  # validate uniqueness for code attribute
  it 'is not valid if the code is not unique' do
    # Create a previous record using the same code of user example and then try
    # to save the user example
    FactoryBot.create(:project, code: project_example.code)

    expect(project_example).not_to be_valid
  end

  it 'is not valid if the name is not unique' do
    FactoryBot.create(:project, name: project_example.name)

    expect(project_example).not_to be_valid
  end

  describe "Associations" do
    it 'has many blogs'

    it 'has many concepts'

    it { should have_many(:users) }
  end
end
