## [1.0.0] - 2025-07-08

- Retry with incremental/exponential backoff for 529s and 429s

## [0.0.13] - 2025-06-27

- Add temperature to CreateChatCompletion inputs

## [0.0.12] - 2025-03-01

- Rename :model to :model_enum to avoid collision with Model in filesystems that are case-insensitive

## [0.0.11] - 2025-02-19

- Cache the list of models in ListModels
- Automatically construct the list of valid model names for model_enum at startup

## [0.0.10] - 2025-02-18

- Add a ModelEnum

## [0.0.8] - 2025-02-17

- Add support for some newly added fields
- Make sure our models don't break when OpenAI adds new attributes to their responses
  before we have a chance to update them
- Implement ListModels
- Provide a way to set api token on project module

## [0.0.6] - 2025-02-16

- Rename Completion to ChatCompletion

## [0.0.5] - 2025-02-16

- Rename GenerateChatCompletion to CreateChatCompletion

## [0.0.4] - 2025-02-16

- Rename GenerateCompletion to GenerateChatCompletion
- Bump Ruby to 3.4.2

## [0.0.3] - 2025-01-07

- Bump Ruby to 3.4.1

## [0.0.2] - 2024-06-24

- Add src/ to spec.require_paths and remove lib/

## [0.0.1] - 2024-06-22

- Add Apache-2.0 license

## [0.0.0] - 2024-02-09

- Project birth
