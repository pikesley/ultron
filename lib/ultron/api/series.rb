module Ultron
  module API
    class Series < Entity
      def initialize id
        @id = id
        @path = 'series/%s' % @id
        super @path
      end

      def comics
        nil
      end

      def stories
        nil
      end

      def serieses
        nil
      end
    end
  end
end