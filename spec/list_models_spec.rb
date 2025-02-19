RSpec.describe Foobara::Ai::OpenAiApi::ListModels do
  before do
    FileUtils.rm_f("tmp/cached_command/foobara/ai/open_ai_api/list_models.json")
  end

  let(:inputs) do
    {
      api_token:
    }
  end
  let(:api_token) { ENV.fetch("OPENAI_API_KEY", nil) }

  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }

  it "can generate a completion", vcr: { record: :none } do
    expect(outcome).to be_success

    model_instance = result.first
    expect(model_instance).to be_a(Foobara::Ai::OpenAiApi::Types::Model)
    expect(model_instance.object).to eq("model")
  end
end
