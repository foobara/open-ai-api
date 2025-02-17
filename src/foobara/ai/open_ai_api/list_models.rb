module Foobara
  module Ai
    module OpenAiApi
      class ListModels < BaseCommand
        path "/models"

        inputs do
          api_token :string
        end

        result [Types::Model]

        def build_result
          response_body["data"]
        end
      end
    end
  end
end
