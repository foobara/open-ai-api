require_relative "version"

source "https://rubygems.org"
ruby Foobara::OpenAiApi::MINIMUM_RUBY_VERSION

gemspec

# Uncomment these for debugging
# gem "foobara", path: "../foobara"
# gem "foobara-cached-command", path: "../cached-command"

gem "rake"

group :development do
  gem "foobara-rubocop-rules"
  gem "guard-rspec"
  gem "rubocop-rake"
  gem "rubocop-rspec"
end

group :development, :test do
  gem "foobara-dotenv-loader"
  # gem "foobara-dotenv-loader", path: "../dotenv-loader"
  gem "pry"
  gem "pry-byebug"
end

group :test do
  gem "foobara-spec-helpers"
  gem "rspec"
  gem "rspec-its"
  gem "simplecov"
  gem "vcr"
  gem "webmock"
end
