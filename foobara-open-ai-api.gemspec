require_relative "version"

Gem::Specification.new do |spec|
  spec.name = "foobara-open-ai-api"
  spec.version = Foobara::OpenAiApi::VERSION
  spec.authors = ["Miles Georgi"]
  spec.email = ["azimux@gmail.com"]

  spec.summary = "Foobara commands and models for OpenAI's API"
  spec.homepage = "https://github.com/foobara/open-ai-api"

  # Equivalent to SPDX License Expression: Apache-2.0 OR MIT
  spec.license = "Apache-2.0 OR MIT"
  spec.licenses = ["Apache-2.0", "MIT"]

  spec.required_ruby_version = Foobara::OpenAiApi::MINIMUM_RUBY_VERSION

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.add_dependency "foobara-cached-command", "< 2.0.0"
  spec.add_dependency "foobara-http-api-command", "< 2.0.0"

  spec.files = Dir[
    "lib/**/*",
    "src/**/*",
    "LICENSE*.txt",
    "CHANGELOG.md",
    "README.md"
  ]

  spec.require_paths = ["lib", "src"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
