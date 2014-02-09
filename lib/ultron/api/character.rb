module Ultron
  module API
    class Character < Entity
      def initialize id
        @id = id
        super 'characters/%s' % @id
      end

      def comics
        ComicsSet.new @id
      end
    end
  end
end