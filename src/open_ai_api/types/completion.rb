module Foobara
  module Ai
    module OpenAiApi
      module Types
        class Completion < Foobara::Model
          class Message < Foobara::Model
            attributes do
              role :string, one_of: %w[assistant user system]
              content :string
            end
          end

          class Choice < Foobara::Model
            attributes do
              index :integer
              message Message
              logprobs :duck # what is this? null in documentation
              finish_reason :string, one_of: %w[stop] # what are the real values here?
            end
          end

          class Usage < Foobara::Model
            attributes do
              prompt_tokens :integer
              completion_tokens :integer
              total_tokens :integer
            end
          end

          attributes do
            id :string
            # TODO: create sugar of equals for specifying an exact value
            object :string, one_of: ["chat.completion"]
            created :datetime
            model :string
            system_fingerprint :string, :allow_nil
            choices [Choice]
            usage Usage
          end
        end
      end
    end
  end
end
