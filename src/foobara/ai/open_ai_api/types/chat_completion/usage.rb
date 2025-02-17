module Foobara
  module Ai
    module OpenAiApi
      module Types
        class ChatCompletion < Foobara::Model
          class Usage < Foobara::Model
            attributes do
              prompt_tokens :integer
              completion_tokens :integer
              total_tokens :integer
              prompt_tokens_details do
                audio_tokens :integer
                cached_tokens :integer
              end
              completion_tokens_details do
                accepted_prediction_tokens :integer
                audio_tokens :integer
                reasoning_tokens :integer
                rejected_prediction_tokens :integer
              end
            end
          end
        end
      end
    end
  end
end
