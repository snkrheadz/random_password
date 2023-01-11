# frozen_string_literal: true

RSpec.describe RandomPassword do
  describe 'VERSION' do
    subject { described_class::VERSION }

    it { is_expected.to eq '0.1.1' }
  end

  describe '#new' do
    subject { described_class.new(length: 64, digits: 10, symbols: 10) }

    it { is_expected.to be_an_instance_of(described_class::Base) }
  end

  describe '#generate' do
    subject { described_class.new(length: 64, digits: 10, symbols: 10).generate }

    it { is_expected.to be_an_instance_of(String) }
  end
end
