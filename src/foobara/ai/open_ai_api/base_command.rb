require "foobara/http_api_command"

module Foobara
  module Ai
    module OpenAiApi
      class BaseCommand < Foobara::Command
        class << self
          attr_accessor :api_token
        end

        include HttpApiCommand

        base_url "https://api.openai.com/v1"

        inputs do
          api_token :string
        end

        def api_token
          inputs[:api_token] || BaseCommand.api_token || api_token_from_env
        end

        def api_token_from_env
          ENV.fetch("OPENAI_API_KEY", nil)
        end

        def build_request_headers
          self.request_headers = { "Content-Type" => "application/json", "Authorization" => "Bearer #{api_token}" }
        end
      end
    end
  end
end
