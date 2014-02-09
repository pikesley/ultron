module Ultron
  class Characters
    def initialize
      @cnxn =  Ultron::Connection.new 'characters'
    end

    def [] key
      results[key]
    end

    def results
      @results || begin
        @cnxn.perform['data']['results']
      end
    end

    def by_name name
      @cnxn.add_params 'name' => name
      @cnxn.perform['data']['results'].first
    end
  end
end