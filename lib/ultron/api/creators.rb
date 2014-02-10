module Ultron
  module API
    class Creators < Entities
      def initialize path = nil
        path = 'creators' if path.nil?
        super path
      end

      def [] key
        Creator.new results[key]['id']
      end
    end
  end
end