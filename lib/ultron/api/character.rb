module Ultron
  module API
    class Character < Entity
      def initialize id
        @id = id
        @path = 'characters/%s' % @id
        super @path
      end
    end
  end
end