module Ultron
  module API
    class ComicSet < EntitySet
      def initialize path
        super '%s/comics' % path
      end

      def [] key
        Comic.new results[key]['id']
      end
    end
  end
end