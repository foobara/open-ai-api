require_relative "src/version"

Gem::Specification.new do |spec|
  spec.name = "foobara-open-ai-api"
  spec.version = Foobara::OpenAiApi::VERSION
  spec.authors = ["Miles Georgi"]
  spec.email = ["azimux@gmail.com"]

  spec.summary = "Foobara commands and models for OpenAI's API"
  spec.homepage = "https://github.com/foobara/open-ai-api"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.add_dependency "foobara"

  spec.files = Dir[
    "lib/**/*",
    "src/**/*",
    "LICENSE.txt"
  ]

  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
