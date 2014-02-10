module Ultron
  module API
    class Entities
      include Enumerable

      def initialize type
        @cnxn = Ultron::Connection.new type
      end

      def each
        results.each do |item|
          yield item
        end
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

      def last
        results[-1]
      end

      def any?
        results.any?
      end

      def results
        @results || begin
          @cnxn.perform['data']['results']
        end
      end

      def by_name name
        @cnxn.add_params 'name' => name
        @cnxn.perform['data']['results'].first
      end
    end
  end
end