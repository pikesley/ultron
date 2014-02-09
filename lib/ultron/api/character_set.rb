module Ultron
  module API
    class CharacterSet
      include Enumerable

      def initialize p
        @cnxn = Ultron::Connection.new '%s/characters' % p
      end

      def [] key
        Character.new results[key]['id']
      end

      def each
        @results.each do |character|
          yield character
        end
      end

      def results
        @results || begin
          @cnxn.perform['data']['results']
        end
      end
    end
  end
end