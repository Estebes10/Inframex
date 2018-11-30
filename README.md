# Inframex

Application settings:

**INSTALL POSTGRESQL**
**CHANGE database Configuration file in `config/database.yml` with YOUR CREDENTIALS**

* Ruby version
  - 2.5.1
* Rails version
  - 5.2.1

* System dependencies
  * rspec-rails - Testing framework. [Rspec](https://github.com/rspec/rspec-rails)
  * factory_girl_rails - Factory pattern for building objects
  * shoulda_matchers - Provides RSpec with additional matchers.
  * database_cleaner - Gem to clean our test database to ensure a clean state in each test suite.
  * faker - A library for generating fake data.

## Configuration
  * Database creation AFTER CLONE REPOSITORY
    * Prepare database (Create database, load schema and initialize seeds)
    ```shell
      rails db:setup
    ```

  * Database initialization
    * Load schema and initialize seeds
    ```shell
      rails db:schema:load
      rails db:seed
    ```

  * Reset database
    * Reset database
    ```shell
      rails db:reset -> rails db:drop db:setup.
    ```

    * Update schema file
    ```shell
      rails db:schema:dump
      rails db:migrate:reset
    ```
  * Prepare database for test
    ```shell
    rails db:test:prepare
    ```

## Run tests
* How to run the test suite
  ```shell
    bundle exec rspec spec/ -fd --order rand
  ```
