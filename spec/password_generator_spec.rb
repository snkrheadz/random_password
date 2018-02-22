RSpec.describe PasswordGenerator do
  describe "VERSION" do
    subject { PasswordGenerator::VERSION }
    it { is_expected.to eq "0.1.0" }
  end

  describe "#new" do
    subject { PasswordGenerator.new(length: 64, digits: 10, symbols: 10) }
    it { is_expected.to be_an_instance_of(described_class::Base) }
  end

  describe "#generate" do
    let(:password_generator) { PasswordGenerator.new(length: 64, digits: 10, symbols: 10).generate }

    describe "#size" do
      subject { password_generator.size }
      it { is_expected.to eq 64 }
    end
  end
end
