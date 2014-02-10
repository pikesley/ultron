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
        ComicSet.new @path
      end

      def characters
        Characters.new '%s/characters' % @path
      end

      def events
        Events.new '%s/events' % @path
      end

      def has_events?
        events.any?
      end
    end
  end
end