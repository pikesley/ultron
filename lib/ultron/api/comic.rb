module Ultron
  module API
    class Comic < Entity
      def initialize id
        @id = id
        super 'comics/%s' % @id
      end
    end
  end
end