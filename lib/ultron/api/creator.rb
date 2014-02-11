module Ultron
  module API
    class Creator < Entity
      def initialize id
        @id = id
        @path = 'creators/%s' % @id
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