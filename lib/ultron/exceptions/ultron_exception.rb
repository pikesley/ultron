module Ultron
  class UltronException < Exception
    attr_reader :status

    def initialize status
      @status = status
    end
  end
end