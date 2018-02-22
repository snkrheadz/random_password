# frozen_string_literal: true

require 'password_generator/version'
require 'password_generator/base'

module PasswordGenerator
  def self.new(**options)
    PasswordGenerator::Base.new(options)
  end

  def self.generate(**options)
    new(options).generate
  end
end
