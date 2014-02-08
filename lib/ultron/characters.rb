module Ultron
  class Characters
    attr_reader :url

    def initialize
      @url = Config.instance.config['host']
    end
  end
end