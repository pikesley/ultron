module Ultron
  module API
    class Comics
      def initialize
        @cnxn = Ultron::Connection.new 'comics'
      end

      def [] key
        Comic.new results[key]['id']
      end

      def results
        @results || begin
          @cnxn.perform['data']['results']
        end
      end
    end
  end
end