ENV["FOOBARA_ENV"] = "test"

require "bundler/setup"

require "pry"
require "pry-byebug"
require "rspec/its"
require "simplecov"
require "vcr"

require "foobara/load_dotenv"

Foobara::LoadDotenv.run!(env: "test")

Warning[:deprecated] = true

SimpleCov.start do
  # enable_coverage :branch
  minimum_coverage line: 100
  # TODO: enable this? worth it to get to 100% branch coverage?
  # minimum_coverage line: 100, branch: 100
end

RSpec.configure do |config|
  config.filter_run_when_matching :focus

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.order = :defined

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # config.raise_errors_for_deprecations!
end

require "foobara/spec_helpers/all"

Dir["#{__dir__}/support/**/*.rb"].each { |f| require f }

# To rerecord this cassette:
# 1. delete list_models.yml
# 2. delete tmp/ (to clear out cached command results)
# 3. change record: :none to record: :once
# 4. uncomment the raise below
# 5. run the test suite
# 6. undo 3 and 4.
VCR.use_cassette("list_models", record: :none) do
  require "foobara/open_ai_api"
end
# raise "Just rerecording the list_models cassette, no need to proceed"
