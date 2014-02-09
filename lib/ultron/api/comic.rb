module Ultron
  module API
    class Comic < Entity
      def initialize id
        @id = id
        super 'comics/%s' % @id
      end

      def characters
        CharacterSet.new @id
      end
    end
  end
end