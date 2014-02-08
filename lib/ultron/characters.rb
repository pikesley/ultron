module Ultron
  class Characters
    attr_reader :url

    def initialize
      @url = URI.join(
          Config.instance.config['host'],
          Config.instance.config['path'],
          'characters'
      )
    end
  end
end