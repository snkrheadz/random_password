# frozen_string_literal: true

require 'password_generator/version'
require 'password_generator/base'

module PasswordGenerator
  def self.new(length:, digits:, symbols:)
    PasswordGenerator::Base.new(length: length, digits: digits, symbols: symbols)
  end
end
