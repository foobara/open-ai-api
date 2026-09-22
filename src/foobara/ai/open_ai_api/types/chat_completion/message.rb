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
              # TODO: Figure out what type this really is. Maybe an array of some Annotation model.
              # TODO: also, see if it can be null (probably not)
              annotations :duckture, :allow_nil
            end
          end
        end
      end
    end
  end
end
