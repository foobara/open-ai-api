RSpec.describe Foobara::Ai::OpenAiApi do
  describe ".default_llm_model" do
    subject { described_class.default_llm_model }

    it { is_expected.to be_a(Symbol) }
  end
end
