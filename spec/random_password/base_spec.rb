# frozen_string_literal: true

RSpec.describe RandomPassword::Base do
  let(:random_password) { described_class.new(length: 64, digits: 10, symbols: 10) }

  describe 'constants' do
    describe 'LETTERS' do
      subject { described_class::LETTERS }

      it { is_expected.to eq [*'a'..'z', *'A'..'Z'] }
    end

    describe 'DIGITS' do
      subject { described_class::DIGITS }

      it { is_expected.to eq [*'0'..'9'] }
    end

    describe 'SYMBOLS' do
      subject { described_class::SYMBOLS }

      it { is_expected.to eq %w(! " # $ % & ' ( ) * + , - . / \\ : ; ? @ [ ] ^ _ ` { | } ~) }
    end
  end

  describe '#generate' do
    describe '#is_a? Sting' do
      subject { random_password.generate }

      it { is_expected.to be_an_instance_of(String) }
    end

    describe 'match chars' do
      subject { random_password.generate }

      it { is_expected.to match(%r{[a-zA-Z0-9!"#$%&'()*+,-./\\:;<=>?@\[\]\^_`\{|\}~]{64}}) }
    end

    describe '#size' do
      subject { random_password.generate.size }

      context 'when length is 64' do
        before { random_password.update(length: 64) }

        it { is_expected.to eq(64) }
      end

      context 'when length is 10' do
        before { random_password.update(length: 10) }

        it { is_expected.to eq(10) }
      end
    end

    describe '#update' do
      subject { random_password.update(length: 12) }

      it { is_expected.to be_an_instance_of(described_class) }
    end

    describe 'instance valiables' do
      context 'when update all available options' do
        before { random_password.update(length: 12, digits: 3, symbols: 7) }

        it { expect(random_password.instance_variable_get(:@length)).to eq(12) }
        it { expect(random_password.instance_variable_get(:@digits)).to eq(3) }
        it { expect(random_password.instance_variable_get(:@symbols)).to eq(7) }
      end

      context 'when update symbols to 5' do
        subject { random_password.update(symbols: 5).instance_variable_get(:@symbols) }

        before { random_password.update(symbols: 5) }

        it { is_expected.to eq(5) }
      end
    end

    describe 'private' do
      describe '#password_letters' do
        subject { random_password.send(:password_letters) }

        it { is_expected.to be_an_instance_of(Array) }
      end

      describe '#random_letter' do
        it 'is a letter which in LETTERS' do
          101.times do
            expect(described_class::LETTERS).to include(random_password.send(:random_letter))
          end
        end
      end

      describe '#random_digit' do
        it 'is a letter which in DIGITS' do
          101.times do
            expect(described_class::DIGITS).to include(random_password.send(:random_digit))
          end
        end
      end

      describe '#random_symbol' do
        it 'is a letter which in SYMBOLS' do
          101.times do
            expect(described_class::SYMBOLS).to include(random_password.send(:random_symbol))
          end
        end
      end
    end
  end
end
