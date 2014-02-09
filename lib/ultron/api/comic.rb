module Ultron
  module API
    class Comic < Entity
      def initialize id
        @id = id
        @path = 'comics/%s' % @id
        super @path
      end
    end
  end
end