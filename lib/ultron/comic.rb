module Ultron
  class Comic
    def initialize id
      @id = id
      @cnxn = Ultron::Connection.new 'comics/%s' % @id
    end

    def title
      Ultron.title_extractor results['title']
    end

    def year
      Ultron.year_extractor results['title']
    end

    def [] key
      results[key]
    end

    def results
      @results || begin
        @cnxn.perform['data']['results'].first
      end
    end
  end
end