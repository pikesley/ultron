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

      def method_missing method_name, *args
        results.send(method_name)
      end

      def results
        @results || begin
          OpenStruct.new @cnxn.perform['data']['results'].first
        end
      end

      def comics
        ComicsSet.new @id
      end
    end
  end
end