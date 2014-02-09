module Ultron
  module API
    class EntitySet
      include Enumerable

      def initialize path
        @cnxn = Ultron::Connection.new path
      end

      def each
        @results.each do |item|
          yield item
        end
      end

      def results
        @results || begin
          @cnxn.perform['data']['results']
        end
      end
    end
  end
end