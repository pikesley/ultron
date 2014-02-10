module Ultron
  module API
    class Story < Entity
      def initialize id
        @id = id
        @path = 'stories/%s' % @id
        super @path
      end
    end
  end
end