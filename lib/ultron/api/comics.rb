module Ultron
  module API
    class Comics < Entities
      def initialize
        super 'comics'
      end

      def [] key
        Comic.new results[key]['id']
      end
    end
  end
end