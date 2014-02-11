module Ultron
  module API
    class Character < Entity
      def initialize id
        @id = id
        @path = 'characters/%s' % @id
        super @path
      end

      def characters
        nil
      end

      def creators
        nil
      end
    end
  end
end