# Example of creating a full CRUD in Rails

**Create database in POSTGRESQL**
```shell
rails db:create
```

# MODEL
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
depends on each one. first build test object, where blob_example is the object created
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

# CONTROLLER
## generate controller
* There are two ways to generate a controller, the first one is using the
command line and the second (I recommed use this) is create manually each
controller. The reason is because the generator command creates other files,
such as helpers, scss and coffee files specific to the controller and we do not
need them. To generate the controller using the command, you must to put the
model in plural and optionally add what actions are required.

```shell
rails g controller Blogs index new create show update destroy
```

If you decided to create manually each controller, you just need to create the
controller in:
```shell
app/controllers/
```

then add the corresponding controller test file in:
```shell
spec/controllers/
```

and finally the view folder in
```shell
app/views/
```

## Test controller methods
* For controllers it is recommendable to group each action and its tests, as the
following example for the index method

```ruby
RSpec.describe BlogsController do
  describe "GET index" do
    it "assigns @blogs" do
      blog = Blog.create
      get :index
      expect(assigns(:blogs)).to eq([blog])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "has 200 status code" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
```

## Add routes
* Remember to add the corresponding routes for each method of controllers in:
```shell
config/routes.db
```

* There many options to implement a specific path, two common ways are:
** Using resources and specifying which method will be used.
```ruby
resources :blogs, only: %I[index]
```

** Generate paths for each method, using URL, controller and action parameters.
```ruby
get '/blogs', to: 'blogs#index'
```

## Test rounting
* To test routes, we can consider if the path is routeable and if there is an
action associated to it. e.g for: ```spec/routes/blogs_routing_spec.rb```.
```ruby
require "rails_helper"

RSpec.describe 'routes for blogs', :type => :routing do

  context 'for index method' do
    it "should route to /blogs" do
      expect(:get => "/blogs").to be_routable
    end

    it "routes /blogs to blogs controller" do
      expect(get("/blogs")).to route_to("blogs#index")
    end
  end

end
```

## View test
* For views, we can test string matches for each template body and if the view
can infers the controller path and its corresponding action.
```ruby
require 'rails_helper'

RSpec.describe 'blogs/index.html.erb', type: :view do

  context 'with 2 blogs' do
    before(:each) do
      assign(:blogs, [
        FactoryBot.create(:blog, name: 'Bitacora B1'),
        FactoryBot.create(:blog, name: 'Bitacora B2')
      ])
    end

    it 'displays both blogs' do
      render

      # Test if the name of both objects are rendered
      expect(rendered).to match /Bitacora B1/
      expect(rendered).to match /Bitacora B2/
    end

    it 'infers the controller path' do
      expect(controller.request.path_parameters[:controller]).to eq('blogs')
      expect(controller.controller_path).to eq('blogs')
    end

    it 'infers the controller action' do
      expect(controller.request.path_parameters[:action]).to eq('index')
    end
  end

end
```

## Integration test
* Rspec uses Capybara to test a complete functionality in the application.
you just need to create a new file in ```spec/features/```, this is the name to
describe integration test in Rspec.
** This is a test example for login.
```ruby
# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign in')
  end

  def sign_up_with(email, password)
    visit sign_up_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'
  end
end
```

** This is a more complete test
```ruby
feature "Signing in" do
  background do
    User.make(email: 'user@example.com', password: 'caplin')
  end

  scenario "Signing in with correct credentials" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'caplin'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end

  given(:other_user) { User.make(email: 'other@example.com', password: 'rous') }

  scenario "Signing in as another user" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with: other_user.email
      fill_in 'Password', with: other_user.password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end
end
```

** Example to create one record (Blog)
```ruby
require 'rails_helper.rb'

feature 'Creating Blog' do  
  scenario 'can create a blog' do
    # 1. go to root where will be button to add a new blog:
    visit '/blogs'
    # 2. click on Agregar bitácora button
    click_link 'Agregar bitácora'
    # 3. Fill form - add name, description and date
    fill_in 'name', with: 'Bitacora B32'
    fill_in 'description', with: 'Ejemplo'
    fill_in 'blog_date', with: '22 de Noviembre de 2018'
    # 4. Click on submit form button
    click_button 'Guardar'
    # 5. Then we should be redirected to show page with blog details (blog name, description, images, etc.)
    expect(page).to have_content('Bitacora B32 guardada correctamente')
  end
end
```
* To read more about how to implement integration tests with Rspec and Capybara,
go to the following pages [Official Capybara site](https://www.rubydoc.info/github/jnicklas/capybara/master)
or [Rspec Feature spec](https://relishapp.com/rspec/rspec-rails/v/3-8/docs/feature-specs/feature-spec).
and [this one](https://robots.thoughtbot.com/rspec-integration-tests-with-capybara#integration-test-with-rspec-and-capybara)
shows and example of how to implement helpers for tests.
