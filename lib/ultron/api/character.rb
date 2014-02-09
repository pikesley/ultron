module Ultron
  module API
    class Character
      def initialize id
        @id   = id
        @cnxn = Ultron::Connection.new 'characters/%s' % @id
      end

      def [] key
        results[key]
      end

      def results
        @results || begin
          @cnxn.perform['data']['results'].first
        end
      end

      def comics
        ComicsSet.new @id
      end
    end
  end
end