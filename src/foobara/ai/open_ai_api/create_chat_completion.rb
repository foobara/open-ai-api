require_relative "base_command"

module Foobara
  module Ai
    module OpenAiApi
      class CreateChatCompletion < BaseCommand
        path "/chat/completions"
        http_method :post

        add_inputs do
          model :model_enum, default: Types::ModelEnum::GPT_3_5_TURBO
          messages :array do
            role :string, one_of: ["system", "user", "assistant"]
            content :string
          end
          temperature :float
        end

        result Types::ChatCompletion

        def build_request_body
          self.request_body = { model:, messages:, temperature: }
        end

        def build_result
          Types::ChatCompletion.new(response_body, ignore_unexpected_attributes: true)
        end
      end
    end
  end
end
