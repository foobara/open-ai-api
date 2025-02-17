require "net/http"
require "uri"

module Foobara
  module Ai
    module OpenAiApi
      foobara_domain!

      class << self
        def api_token=(token)
          BaseCommand.api_token = token
        end

        def api_token
          BaseCommand.api_token
        end
      end
    end
  end
end
