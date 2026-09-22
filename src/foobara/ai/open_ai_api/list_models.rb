require_relative "base_command"
require_relative "types/model"
require "foobara/cached_command"

module Foobara
  module Ai
    module OpenAiApi
      class ListModels < BaseCommand
        include CachedCommand

        self.foobara_cache_expiry = 24 * 60 * 60

        path "/models"

        result [Types::Model]

        def build_result
          response_body["data"].map do |model_attributes|
            Types::Model.new(
              model_attributes,
              # Set to false and run test suite with new cassettes if trying to find new attributes
              ignore_unexpected_attributes: true
            )
          end
        end
      end
    end
  end
end
