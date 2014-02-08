module Ultron
  class Characters
    attr_reader :url

    def initialize
      @url = 'http://gateway.marvel.com'
    end
  end
end