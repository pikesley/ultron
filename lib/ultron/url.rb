module Ultron
  class URL
    attr_reader :path, :query

    def initialize path, query
      @path  = path
      @query = query
    end

    def to_s
      "%s%s?%s%s" % [Ultron::Config.instance.root_url, @path, @query, Ultron.auth(ENV['PRIVATE_KEY'], ENV['PUBLIC_KEY'])]
    end

    def == other
      other.path == @path && other.query == @query
    end
  end
end