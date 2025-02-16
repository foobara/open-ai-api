module Foobara
  module Ai
    module OpenAiApi
      module Types
        class ChatCompletion < Foobara::Model
          class Choice < Foobara::Model
            attributes do
              index :integer
              message Message
              logprobs :duck # what is this? null in documentation
              finish_reason :string, one_of: %w[stop] # what are the real values here?
            end
          end
        end
      end
    end
  end
end
