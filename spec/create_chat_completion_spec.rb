RSpec.describe Foobara::Ai::OpenAiApi::CreateChatCompletion do
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
    expect(result).to be_a(Foobara::Ai::OpenAiApi::Types::ChatCompletion)
    expect(result.choices.first.message.content).to match(/pH of honey.*\d+\.\d+ (to|and) \d+\.\d+/)
  end

  context "when setting api token via env" do
    let(:inputs) do
      { messages: }
    end

    it "can generate a completion", vcr: { record: :none } do
      expect(outcome).to be_success
      expect(result).to be_a(Foobara::Ai::OpenAiApi::Types::ChatCompletion)
      expect(result.choices.first.message.content).to match(/pH of honey.*\d+\.\d+ (to|and) \d+\.\d+/)
    end
  end

  context "when setting api token on project module" do
    before do
      allow(command).to receive(:api_token_from_env).and_return(nil)
    end

    around do |example|
      old_token = Foobara::Ai::OpenAiApi.api_token

      begin
        Foobara::Ai::OpenAiApi.api_token = api_token
        example.run
      ensure
        Foobara::Ai::OpenAiApi.api_token = old_token
      end
    end

    let(:inputs) do
      { messages: }
    end

    it "can generate a completion", vcr: { record: :none } do
      expect(outcome).to be_success
      expect(result).to be_a(Foobara::Ai::OpenAiApi::Types::ChatCompletion)
      expect(result.choices.first.message.content).to match(/pH of honey.*\d+\.\d+ (to|and) \d+\.\d+/)
    end
  end
end
