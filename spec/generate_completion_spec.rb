RSpec.describe Foobara::Ai::OpenAiApi::GenerateCompletion do
  let(:inputs) do
    {
      api_token:,
      messages:
    }
  end
  let(:api_token) { ENV.fetch("OPENAI_API_KEY", nil) }
  let(:messages) do
    [
      {
        role: "system",
        content: "You are like a scientist that answers questions very concisely and accurately."
      },
      {
        role: "user",
        content: "What is the PH of honey?"
      }
    ]
  end

  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }

  it "can generate a completion", vcr: { record: :none } do
    expect(outcome).to be_success
    expect(result).to be_a(Foobara::Ai::OpenAiApi::Types::Completion)
    expect(result.choices.first.message.content).to match(/pH of honey.*\d+\.\d+ (to|and) \d+\.\d+/)
  end
end
