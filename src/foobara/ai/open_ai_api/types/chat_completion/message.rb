module Foobara
  module Ai
    module OpenAiApi
      module Types
        class ChatCompletion < Foobara::Model
          class Message < Foobara::Model
            attributes do
              role :string, one_of: ["assistant", "user", "system"]
              content :string
              refusal :string, :allow_nil
            end
          end
        end
      end
    end
  end
end
