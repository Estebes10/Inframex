source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgreSQL as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Particles gem
gem 'particles-js-rails', '~> 2.0'
#Autofill
gem 'jquery-ui-rails'

# Themify gem
gem 'themify-icons-rails' , github: 'scratch-soft/themify-icons-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# CSS Framework
gem 'bootstrap', '~> 4.1.3'
gem 'popper_js', '~> 1.14'
# Javascript framework used in bootstrap
gem 'jquery-rails'
gem 'jquery-datatables'
gem 'sweetalert-rails'
# date input styles
gem 'bootstrap-datepicker-rails', '~> 1.6', '>= 1.6.1.1'
# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

gem 'google-cloud-asset', '~> 0.1.1', require: false

gem "appengine", "~> 0.4.6"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test, :staging do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Testing framework.
  gem 'rspec-rails', '~> 3.8'

  # Generator of fake objects
  gem 'factory_bot_rails', '~> 4.10'

  # Provides RSpec with additional matchers.
  gem 'shoulda-matchers', '~> 3.1'
  # A library for generating fake data. We'll use this to generate test data.
  gem 'faker', '~> 1.8.7'
end

group :test  do
  # Gem for cleaning the test database to ensure a clean state in each test suite.
  gem 'database_cleaner'

  gem 'rails-controller-testing'

  # Test web applications by simulating how a real user would interact with the app
  gem 'capybara'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Please add the following to your Gemfile to avoid polling for changes:
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
