module Ultron
  module API
    class Characters < Entities
      def initialize
        super 'characters'
      end

      def [] key
        Character.new results[key]['id']
      end

      def by_name name
        @cnxn.add_params 'name' => name
        @cnxn.perform['data']['results'].first
      end
    end
  end
end