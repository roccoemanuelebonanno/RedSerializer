RSpec.describe Serializer do
  describe "#serialize" do
    context "when serializing an ActiveRecord object" do
      let(:active_record_object) do
        double("ActiveRecord::Base", attribute_names: %w[name age], name: "John", age: 30)
      end
      subject { described_class.new(active_record_object).serialize }

      xit "returns a hash with attributes" do
        expect(subject).to eq({ name: "John", age: 30 })
      end
    end

    context "when serializing a plain old Ruby object (PORO)" do
      let(:poro_object) do
        obj = Object.new
        obj.instance_variable_set(:@name, "Jane")
        obj.instance_variable_set(:@age, 25)
        obj
      end
      subject { described_class.new(poro_object).serialize }

      it "returns a hash with instance variable values" do
        expect(subject).to eq({ name: "Jane", age: 25 })
      end
    end
  end
end
