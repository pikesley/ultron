module Ultron
  module API
    class Entity
      def initialize path
        @cnxn = Ultron::Connection.new path
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
        ComicsSet.new @path
      end

      def characters
        CharacterSet.new @path
      end

      def events
        EventSet.new @path
      end
    end
  end
end