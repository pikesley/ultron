module Ultron
  module API
    class EventSet < Entities
      def initialize path
        super '%s/events' % path
      end

      def [] key
        Event.new results[key]['id']
      end
    end
  end
end