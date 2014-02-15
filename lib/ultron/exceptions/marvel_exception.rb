module Ultron
  class MarvelException < Exception
    attr_reader :code, :status

    def initialize params
      @code   = params['code'].to_i
      @status = params['status']
    end
  end
end