RSpec.describe Foobara do
  describe ".manifest" do
    let(:manifest) { described_class.manifest }

    it "has expected models" do
      type = described_class.foobara_root_namespace.foobara_lookup_type!(
        "Foobara::Ai::OpenAiApi::Types::Completion::Message"
      )
      expect(Foobara::Ai::OpenAiApi::Types::Completion::Message.model_type).to be(type)
      expect(Foobara::Ai::OpenAiApi::Types::Completion::Message.domain).to be(Foobara::Ai::OpenAiApi)
      expect(type.scoped_full_path).to eq(%w[Foobara Ai OpenAiApi Types Completion Message])
      expect(type.scoped_path).to eq(%w[Types Completion Message])
      expect(type.foobara_domain).to be(Foobara::Ai::OpenAiApi)
      # TODO: why not Foobara::Ai::OpenAiApi::Types::Completion? I guess because it's a model class and not a type?
      expect(type.scoped_namespace).to be(Foobara::Ai::OpenAiApi)

      type_manifest = manifest[:type][:"Foobara::Ai::OpenAiApi::Types::Completion::Message"]

      expect(type_manifest).to be_a(Hash)

      expect(type_manifest[:scoped_path]).to eq(%w[Types Completion Message])
      expect(type_manifest[:scoped_name]).to eq("Types::Completion::Message")
      expect(type_manifest[:scoped_prefix]).to eq(%w[Types Completion])
      expect(type_manifest[:scoped_full_path]).to eq(%w[Foobara Ai OpenAiApi Types Completion Message])
      expect(type_manifest[:reference]).to eq("Foobara::Ai::OpenAiApi::Types::Completion::Message")
      expect(type_manifest[:domain]).to eq("Foobara::Ai::OpenAiApi")
      expect(type_manifest[:organization]).to eq("Foobara")
      expect(type_manifest[:parent]).to eq([:domain, "Foobara::Ai::OpenAiApi"])
      expect(type_manifest[:name]).to eq("Foobara::Ai::OpenAiApi::Types::Completion::Message")
      expect(type_manifest[:model_class]).to eq("Foobara::Ai::OpenAiApi::Types::Completion::Message")
      expect(type_manifest[:model_name]).to eq("Types::Completion::Message")
      expect(type_manifest[:model_base_class]).to eq("Foobara::Model")
    end
  end
end
