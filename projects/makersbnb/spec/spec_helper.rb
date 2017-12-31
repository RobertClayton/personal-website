ENV['RACK_ENV'] = 'test'

require './app/models/data_mapper_setup.rb'
require './app/models/user.rb'
require './app/models/rental.rb'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'
require_relative '../app/app.rb'
require_relative './features/web_helpers'
# require_relative './features/rental_spec'

Capybara.app = MakersBnB

Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  # config.shared_context_metadata_behavior = :apply_to_host_groups
end
