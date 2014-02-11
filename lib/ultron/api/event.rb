module Ultron
  module API
    class Event < Entity
      def initialize id
        @id = id
        @path = 'events/%s' % @id
        super @path
      end

      def events
        nil
      end
    end
  end
end