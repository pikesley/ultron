module Ultron
  class Characters
    attr_reader :url

    def initialize
      @url = Ultron.get_url 'characters'
    end

    def results

    end
  end
end