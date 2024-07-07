# frozen_string_literal: true

RSpec.describe RedSerializer do
  describe "#version" do
    it "has a version number" do
      expect(RedSerializer::VERSION).not_to be nil
    end
  end

  describe "#serialize" do
    let(:poro_object) do
      obj = Object.new
      obj.instance_variable_set(:@name, "Jane")
      obj.instance_variable_set(:@age, 25)
      obj
    end

    subject { described_class.serialize(poro_object) }
    it "serialize poro" do
      expect(subject).to eq({ name: "Jane", age: 25 })
    end
  end
end
