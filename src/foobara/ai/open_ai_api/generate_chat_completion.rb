module Foobara
  module Ai
    module OpenAiApi
      class GenerateCompletion < Foobara::Command
        URL = "https://api.openai.com/v1/chat/completions".freeze

        inputs do
          # TODO: come up with some kind of execution context object to wrap all of these calls upon which
          # data wrapping a "request" can live instead of being passed around?
          api_token :string
          model :string, default: "gpt-3.5-turbo", one_of: %w[gpt-3.5-turbo gpt-4]
          messages :array do
            role :string, one_of: %w[system user assistant]
            content :string
          end
        end

        result Types::Completion

        def execute
          build_request_body
          build_request_headers
          issue_http_request
          parse_response
          build_completion

          completion
        end

        attr_accessor :request_body, :request_headers, :response, :response_body, :completion

        def build_request_body
          self.request_body = { model:, messages: }
        end

        def build_request_headers
          self.request_headers = { "Content-Type" => "application/json", "Authorization" => "Bearer #{api_token}" }
        end

        def api_token
          inputs[:api_token] || ENV.fetch("OPENAI_API_KEY", nil)
        end

        def issue_http_request
          url = URI.parse(URL)
          self.response = Net::HTTP.post(url, JSON.generate(request_body), request_headers)
        end

        def parse_response
          completion_json = if response.is_a?(Net::HTTPSuccess)
                              response.body
                            else
                              # :nocov:
                              raise "Could not get completion from #{URL}: " \
                                    "#{response.code} #{response.message}"
                              # :nocov:
                            end

          self.response_body = JSON.parse(completion_json)
        end

        def build_completion
          self.completion = Types::Completion.new(response_body)
        end
      end
    end
  end
end
