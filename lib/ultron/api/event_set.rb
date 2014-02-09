module Ultron
  module API
    class EventSet < EntitySet
      def initialize path
        super '%s/events' % path
      end

      def [] key
        Event.new results[key]['id']
      end
    end
  end
end