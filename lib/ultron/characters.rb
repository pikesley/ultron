module Ultron
  class Characters
    def initialize
    end

#    include Enumerable

#    def each
#      @results.each { |result| yield result }
#    end

    def [] key
      results[key]
    end

    def results
      @results || begin
        cnxn     = Ultron::Connection.new 'characters'
        cnxn.perform['data']['results']
      end
    end
  end
end