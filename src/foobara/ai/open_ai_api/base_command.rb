require "foobara/http_api_command"

module Foobara
  module Ai
    module OpenAiApi
      class BaseCommand < Foobara::Command
        include HttpApiCommand

        base_url "https://api.openai.com/v1"

        inputs do
          # TODO: come up with some kind of execution context object to wrap all of these calls upon which
          # data wrapping a "request" can live instead of being passed around?
          api_token :string
        end

        def api_token
          inputs[:api_token] || ENV.fetch("OPENAI_API_KEY", nil)
        end

        def build_request_headers
          self.request_headers = { "Content-Type" => "application/json", "Authorization" => "Bearer #{api_token}" }
        end
      end
    end
  end
end
