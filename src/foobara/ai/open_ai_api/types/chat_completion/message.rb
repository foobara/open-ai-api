module Foobara
  module Ai
    module OpenAiApi
      module Types
        class ChatCompletion < Foobara::Model
          class Message < Foobara::Model
            attributes do
              role :string, one_of: %w[assistant user system]
              content :string
            end
          end
        end
      end
    end
  end
end
