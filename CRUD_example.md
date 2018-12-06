# Example of creating a full CRUD in Rails

**Create database in POSTGRESQL**
```shell
rails db:create
```

## 1. Model creation
I recommend to create an empty migration and put all constraints manually.
** b. create empty migration and put attribute validations, associations, etc
```shell
rails g model Blob
```

Then, add lengths, presence, default values or indexes.
```ruby
class CreateBlobs < ActiveRecord::Migration[5.2]
  def change
    create_table :blobs do |t|
      t.string  :name,        limit: 256,  null: false
      t.string  :description, limit: 1024, null: false
      t.boolean :status,                   null: false, default: true
      t.date    :blob_date,                null: false

      t.timestamps
    end
  end
end
```

Another option is create model with attributes, but it is not recommended if you
want to put constraints like indexes, attribute length or nullify attributes,
because you will have to do it manually later.
** a. create full migration using cli
```shell
  rails g model Blob attribute1:datatype attribute2:datatype
```

## 2. Run migration to create table in database
* migrate pending migrations
```shell
  rails db:migrate
```

* Rollback if there is a mistake or if you forgot to add columns, restrictions, etc.
this command will undo the last migration
```shell
  rails db:rollback
```

## 3. Fill factory for model
* The next step is to complete the model's Factory to use it in tests or to
create test data in the development environment. Go to spec/factories/MODEL.rb
```ruby
FactoryBot.define do
  factory :blob do
    sequence(:name) { |n| "bitacora #{n} for this project" }
    description Faker::Lorem.paragraph
    blob_date   Faker::Date.between(10.days.ago, 10.days.after)
    status      true
  end
end
```

For the previous example, it makes use of the gem Faker and ruby sequences to
generate data.

## 3. Implement TDD for model
* I suggest to implement TDD to validate models, controllers and views, but that
depends on each one.
** build test object, where blob_example is the object created
```ruby
subject(:blob_example) do
  # Returns a blob instance that's not saved
  FactoryBot.build(:blob)
end
```

* Test the valid object without changing the data
```ruby
it 'is valid if name, description, status and blob_date are given' do
  expect(blob_example).to be_valid
end
```

* Then, test presence for each attribute, like in the following example of the
Blob's model attributes
```ruby
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
```

* Add length tests for each attribute
```ruby
it 'is not valid if the descrition contains more than 1024 characters' do
  blob_example.description = 'a' * 1025

  expect(blob_example).not_to be_valid
end

it 'is not valid if the name contains more than 256 characters' do
  blob_example.name = 'a' * 257

  expect(blob_example).not_to be_valid
end
```

* Validate uniqueness of attributes that require it
```ruby
it 'is not valid if the name is not unique' do
  # Create a previous record using the same name of blob example and then try
  # to save the blob example
  FactoryBot.create(:blob, name: blob_example.name)

  expect(blob_example).not_to be_valid
end
```

** Finally, add tests for associations, if the other tables are not created yet,
just leave the description of the test.
```ruby
it 'has many expenses'

it 'has many pictures'

it 'belongs to project'
```


## 4. Add validations in the model
* after implementing the tests, all should fail, until the validations are added
to the corresponding model. The following example shows how to validate each
attribute
```ruby
class Blob < ApplicationRecord

  # Pending associations
  #has_many :pictures

  #belongs_to :project

  #has_many :expenses

  # Attributes validation
  validates :name,
    uniqueness: true,
    presence:   true,
    length:     { maximum: 256 }

  validates :description,
    presence:   true,
    length:     { maximum: 1024 }

  validates :blob_date,
    presence:   true

  validates :status,
    inclusion: { in: [true, false] } # validate presence for booleans

end
```
