module Ultron
  module API
    class Comics < Entities
      def initialize path = nil
        path = 'comics' if path.nil?
        super path
      end

      def [] key
        Comic.new results[key]['id']
      end
    end
  end
end