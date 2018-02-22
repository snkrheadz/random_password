# frozen_string_literal: true

require 'random_password/version'
require 'random_password/base'

module RandomPassword
  def self.new(**options)
    RandomPassword::Base.new(options)
  end

  def self.generate(**options)
    new(options).generate
  end
end
