module Ultron
  module API
    class Comic
      def initialize id
        @id   = id
        @cnxn = Ultron::Connection.new 'comics/%s' % @id
      end

 #     def title
 #       Ultron.title_extractor results['title']
 #     end

 #     def year
 #       Ultron.year_extractor results['title']
 #     end

      def [] key
        results[key]
      end

      def method_missing method_name, *args
        results.send(method_name)
      end

      def results
        @results || begin
          OpenStruct.new @cnxn.perform['data']['results'].first
        end
      end
    end
  end
end