module Ultron
  module API
    class Entities
      attr_accessor :metadata
      include Enumerable

      def self.random_id
        e = self.new
        total = e.metadata['total']

        e.by_offset Random.rand(total)
        e.by_limit 1

        e[0]['id']
      end

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

      def remove_param p
        @cnxn.remove_param p
      end

      def length
        results.length
      end

      def metadata
        @metadata || begin
          @cnxn.perform['data']
        end
      end

      def results
        @results || begin
          @metadata = @cnxn.perform
          @metadata['data']['results']
        rescue NoMethodError
          []
        end
      end

      def method_missing method_name, *args
        method_name = method_name.to_s
        if param = method_name.match(/^by_(.*)/)[1]
          @cnxn.add_params param => args.join(' ')
          @cnxn.perform['data']['results'][0]
        end
      end
    end
  end
end