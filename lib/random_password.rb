# frozen_string_literal: true

require 'random_password/version'
require 'random_password/base'

module RandomPassword
  def self.new(*_, **options)
    RandomPassword::Base.new(**options)
  end

  def self.generate(*_, **options)
    new(**options).generate
  end
end
