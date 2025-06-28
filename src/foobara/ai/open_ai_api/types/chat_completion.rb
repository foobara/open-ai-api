module Foobara
  module Ai
    module OpenAiApi
      module Types
        class ChatCompletion < Foobara::Model
          attributes do
            id :string
            # TODO: create sugar of equals for specifying an exact value
            object :string, one_of: ["chat.completion"]
            created :datetime
            model :string
            system_fingerprint :string, :allow_nil
            choices [Choice]
            usage Usage
            service_tier :string, :allow_nil, one_of: ["auto", "default"]
          end
        end
      end
    end
  end
end
