# frozen_string_literal: true

require_relative 'request_stub'
require_relative 'action_stub'
require_relative 'matchers/request_including_matcher'

module GrpcMock
  module Api
    # @param path [String]
    def stub_request(path)
      GrpcMock.stub_registry.register_request_stub(GrpcMock::RequestStub.new(path))
    end

    def stub_grpc_action(path, rpc_action)
      GrpcMock.stub_registry.register_request_stub(GrpcMock::ActionStub.new(path, rpc_action))
    end

    # @param values [Hash]
    def request_including(values)
      GrpcMock::Matchers::RequestIncludingMatcher.new(values)
    end

    def disable_net_connect!
      GrpcMock.config.allow_net_connect = false
    end

    def allow_net_connect!
      GrpcMock.config.allow_net_connect = true
    end
  end
end
