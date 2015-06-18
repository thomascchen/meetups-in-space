# ENV['RACK_ENV'] = 'test'

require 'pry'
require 'rspec'
require 'capybara/rspec'

require_relative '../app.rb'

set :environment, :test
# <-- This is not necessary with ENV['RACK_ENV'] = 'test' above

Capybara.app = Sinatra::Application

require "database_cleaner"

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
