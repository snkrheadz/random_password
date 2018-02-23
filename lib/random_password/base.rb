# frozen_string_literal: true

module RandomPassword
  class Base
    LETTERS = [*'a'..'z', *'A'..'Z'].freeze
    DIGITS  = [*'0'..'9'].freeze
    SYMBOLS = %w(! " # $ % & ' ( ) * + , - . / \\ : ; ? @ [ ] ^ _ ` { | } ~).freeze

    def initialize(**options)
      update(options)
    end

    def generate
      password_letters.shuffle(random: Random.new).join[0, @length]
    end

    def update(**options)
      @length  = options[:length].to_i
      @digits  = options[:digits].to_i
      @symbols = options[:symbols].to_i
      self
    end

    private

    def password_letters
      passwords = []
      passwords.concat(@digits.times.map { random_digit })
      passwords.concat(@symbols.times.map { random_symbol })
      passwords.concat((@length - @digits - @symbols).times.map { random_letter })
    end

    def random_letter
      LETTERS.sample
    end

    def random_digit
      DIGITS.sample
    end

    def random_symbol
      SYMBOLS.sample
    end
  end
end
