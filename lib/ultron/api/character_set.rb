module Ultron
  module API
    class CharacterSet < Entities
      def initialize path
        super '%s/characters' % path
      end

      def [] key
        Character.new results[key]['id']
      end
    end
  end
end