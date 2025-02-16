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
            end
          end
        end
      end
    end
  end
end
