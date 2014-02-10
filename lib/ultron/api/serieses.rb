module Ultron
  module API
    class Serieses < Entities
      def initialize path = nil
        path = 'series' if path.nil?
        super path
      end

      def [] key
        Series.new results[key]['id']
      end
    end
  end
end