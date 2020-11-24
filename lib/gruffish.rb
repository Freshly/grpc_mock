# frozen_string_literal: true

require_relative 'gruffish/api'
require_relative 'gruffish/version'
require_relative 'gruffish/configuration'
require_relative 'gruffish/adapter'
require_relative 'gruffish/stub_registry'

module GrpcMock
  extend GrpcMock::Api

  class << self
    def enable!
      adapter.enable!
    end

    def disable!
      adapter.disable!
    end

    def reset!
      GrpcMock.stub_registry.reset!
    end

    def stub_registry
      @stub_registry ||= GrpcMock::StubRegistry.new
    end

    def adapter
      @adapter ||= Adapter.new
    end

    def config
      @config ||= Configuration.new
    end
  end

  # Hook into GRPC::ClientStub
  # https://github.com/grpc/grpc/blob/bec3b5ada2c5e5d782dff0b7b5018df646b65cb0/src/ruby/lib/grpc/generic/service.rb#L150-L186
  GRPC::ClientStub.prepend GrpcStubAdapter::MockStub
end
