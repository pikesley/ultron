module Ultron
  module API
    class Events < Entities
      def initialize
        super 'events'
      end

      def [] key
        Event.new results[key]['id']
      end
    end
  end
end