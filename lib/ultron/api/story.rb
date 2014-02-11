module Ultron
  module API
    class Story < Entity
      def initialize id
        @id = id
        @path = 'stories/%s' % @id
        super @path
      end

      def stories
        nil
      end
    end
  end
end