module Ultron
  module API
    class ComicsSet
      include Enumerable

      def initialize p
        @cnxn = Ultron::Connection.new '%s/comics' % p
      end

      def [] key
        Comic.new results[key]['id']
      end

      def each
        @results.each do |comic|
          yield comic
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