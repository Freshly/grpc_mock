# frozen_string_literal: true

module ProtoPharm
  class Configuration
    attr_accessor :allow_net_connect

    def initialize
      @allow_net_connect = true
    end
  end
end
