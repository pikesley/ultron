module Ultron
  module API
    class Characters < Entities
      def initialize path = nil
        path = 'characters' if path.nil?
        super path
      end

      def [] key
        Character.new results[key]['id']
      end
    end
  end
end