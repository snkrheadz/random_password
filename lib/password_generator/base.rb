# frozen_string_literal: true

module PasswordGenerator
  class Base
    LETTERS = [*'a'..'z', *'A'..'Z'].freeze
    DIGITS  = [*'0'..'9'].freeze
    SYMBOLS = %w(! " # $ % & ' ( ) * + , - . / \\ : ; ? @ [ ] ^ _ ` { | } ~).freeze

    def initialize(length:, digits:, symbols:)
      update(length: length, digits: digits, symbols: symbols)
    end

    def generate
      password_letters.shuffle(random: Random.new).join[0...@length]
    end

    def update(length:, digits:, symbols:)
      @length  = length.to_i
      @digits  = digits.to_i
      @symbols = symbols.to_i
    end

    private

    def password_letters
      passwords = []
      passwords.concat((0...@digits).map { random_digit })
      passwords.concat((0...@symbols).map { random_symbol })
      passwords.concat((0...(@length - @digits - @symbols)).map { random_letter })
    end

    def random_letter
      LETTERS[rand(LETTERS.size)]
    end

    def random_digit
      DIGITS[rand(DIGITS.size)]
    end

    def random_symbol
      SYMBOLS[rand(SYMBOLS.size)]
    end
  end
end
