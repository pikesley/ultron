module Ultron
  module API
    SINGLE_OF_SELF = Event

    class Events < Entities
      def initialize path = nil
        path = 'events' if path.nil?
        super path
      end

      def [] key
        Event.new results[key]['id']
      end
    end
  end
end