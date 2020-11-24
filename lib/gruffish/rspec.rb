# frozen_string_literal: true

require 'gruffish'
require_relative 'dsl'

RSpec.configure do |config|
  config.before(:suite) do
    GrpcMock.enable!
  end

  config.after(:suite) do
    GrpcMock.disable!
  end

  config.after(:each) do
    GrpcMock.reset!
  end

  config.include GrpcMock::DSL
end
