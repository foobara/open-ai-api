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
            shutdown_date :date, :allow_nil
          end
        end
      end
    end
  end
end
