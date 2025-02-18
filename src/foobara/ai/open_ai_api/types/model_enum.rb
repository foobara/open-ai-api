module Foobara
  module Ai
    module OpenAiApi
      module Types
        # Can grab an updated list by running something like:
        #
        # irb(main):001> require "foobara/open_ai_api"
        # irb(main):002> Foobara::Ai::OpenAiApi.api_token = File.read("tokens/open_ai_token.txt") and nil
        # irb(main):003> Foobara::Ai::OpenAiApi::ListModels.run!.map(&:id).sort
        # =>
        # ["babbage-002",
        #  "chatgpt-4o-latest",
        #  "dall-e-2",
        #  "dall-e-3",
        #  "davinci-002",
        #  "gpt-3.5-turbo",
        # ...
        ModelEnum = Foobara::Enumerated.make_module(
          "babbage-002",
          "chatgpt-4o-latest",
          "dall-e-2",
          "dall-e-3",
          "davinci-002",
          "gpt-3.5-turbo",
          "gpt-3.5-turbo-0125",
          "gpt-3.5-turbo-1106",
          "gpt-3.5-turbo-16k",
          "gpt-3.5-turbo-instruct",
          "gpt-3.5-turbo-instruct-0914",
          "gpt-4",
          "gpt-4-0125-preview",
          "gpt-4-0613",
          "gpt-4-1106-preview",
          "gpt-4-turbo",
          "gpt-4-turbo-2024-04-09",
          "gpt-4-turbo-preview",
          "gpt-4o",
          "gpt-4o-2024-05-13",
          "gpt-4o-2024-08-06",
          "gpt-4o-2024-11-20",
          "gpt-4o-audio-preview",
          "gpt-4o-audio-preview-2024-10-01",
          "gpt-4o-audio-preview-2024-12-17",
          "gpt-4o-mini",
          "gpt-4o-mini-2024-07-18",
          "gpt-4o-mini-audio-preview",
          "gpt-4o-mini-audio-preview-2024-12-17",
          "gpt-4o-mini-realtime-preview",
          "gpt-4o-mini-realtime-preview-2024-12-17",
          "gpt-4o-realtime-preview",
          "gpt-4o-realtime-preview-2024-10-01",
          "gpt-4o-realtime-preview-2024-12-17",
          "o1-mini",
          "o1-mini-2024-09-12",
          "o1-preview",
          "o1-preview-2024-09-12",
          "omni-moderation-2024-09-26",
          "omni-moderation-latest",
          "text-embedding-3-large",
          "text-embedding-3-small",
          "text-embedding-ada-002",
          "tts-1",
          "tts-1-1106",
          "tts-1-hd",
          "tts-1-hd-1106",
          "whisper-1"
        )

        OpenAiApi.foobara_register_type(:model, :string, one_of: ModelEnum)
      end
    end
  end
end
