module Ultron
  module API
    class Creator < Entity
      def initialize id
        @id = id
        super 'creators/%s' % @id
      end

      def comics
        ComicsSet.new 'creators/%s' % @id
      end
    end
  end
end