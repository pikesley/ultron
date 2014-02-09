module Ultron
  module API
    class Creator < Entity
      def initialize id
        @id = id
        @path = 'creators/%s' % @id
        super @path
      end
    end
  end
end