ENV["FOOBARA_ENV"] = "test"

require "bundler/setup"

require "pry"
require "pry-byebug"
require "rspec/its"
require "simplecov"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<OPEN_AI_KEY>") { ENV.fetch("OPENAI_API_KEY", nil) }
end

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

require "foobara/load_dotenv"

Foobara::LoadDotenv.run!(env: "test")

require "foobara/spec_helpers/all"

VCR.use_cassette("list_models", record: :none) do
  require "foobara/open_ai_api"
end
