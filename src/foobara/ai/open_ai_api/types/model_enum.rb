require_relative "../list_models"

module Foobara
  module Ai
    module OpenAiApi
      module Types
        model_list = ListModels.run!.map(&:id).sort

        ModelEnum = Foobara::Enumerated.make_module(model_list)

        OpenAiApi.foobara_register_type(:model, :string, one_of: ModelEnum)
      end
    end
  end
end
