module Foobara
  module Ai
    module OpenAiApi
      module Types
        class Model < Foobara::Model
          attributes do
            id :string
            created :datetime
            object :string
            owned_by :string
          end
        end
      end
    end
  end
end
