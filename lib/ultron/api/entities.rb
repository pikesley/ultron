module Ultron
  module API
    class Entities
      def initialize type
        @cnxn = Ultron::Connection.new type
      end

      def add_params params
        @cnxn.add_params params
      end

      def length
        results.length
      end

      def first
        results[0]
      end

      def results
        @results || begin
          @cnxn.perform['data']['results']
        end
      end
    end
  end
end