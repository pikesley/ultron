module Ultron
  module API
    class Entities
      def initialize type
        @cnxn = Ultron::Connection.new type
      end

      def results
        @results || begin
          @cnxn.perform['data']['results']
        end
      end
    end
  end
end