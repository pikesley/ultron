module Ultron
  module API
    class Series < Entity
      def initialize id
        @id = id
        @path = 'series/%s' % @id
        super @path
      end
    end
  end
end