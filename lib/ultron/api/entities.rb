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

      def remove_param p
        @cnxn.remove_param p
      end

      def length
        results.length
      end

      def results
        @results || begin
          @cnxn.perform['data']['results']
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