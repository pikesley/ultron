module Ultron
  class NoResultsException < Exception
    attr_reader :status

    def initialize status
      @status = status
    end
  end
end