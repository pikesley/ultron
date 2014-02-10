module Ultron
  module API
    class Stories < Entities
      def initialize path = nil
        path = 'stories' if path.nil?
        super path
      end

      def [] key
        Story.new results[key]['id']
      end
    end
  end
end