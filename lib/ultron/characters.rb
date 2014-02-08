module Ultron
  class Characters
    def initialize
    end

    def results
      cnxn = Ultron::Connection.new 'characters'
      res = cnxn.perform

      res['data']['results']
    end
  end
end