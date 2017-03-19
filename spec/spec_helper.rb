require "bundler/setup"
require File.expand_path('../../lib/kele.rb', __FILE__)
require "kele"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
