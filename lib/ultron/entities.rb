module Ultron
  class Entities
    include Enumerable

    def self.name_for_path
      self.name.split('::')[-1].downcase
    end

    def self.find id
      path     = self.name_for_path
      path     = '%s/%s' % [path, id]
      response = Ultron::Connection.perform get_url path
      case response['code'].to_i
        when 404
          raise NotFoundException.new response

        else
          set = self.new response['data']['results']
          set.first
      end
    end

    def self.method_missing method_name, *args
      mname = method_name.to_s
      query = nil
      path  = self.name_for_path #if mname == 'get'

      parts = mname.split /_and_/
      parts.each do |part|
        case part
          when /by_(.*)/
            path = self.send(:by_something, $1, args.shift)
          when 'with', 'where'
            query = self.send(:by_params, args[0])
        end
      end

      response = Ultron::Connection.perform get_url path, query
      unless response['data']['results'].any?
        raise NoResultsException.new 'That search returned no results'
      end
      self.new response['data']['results']
    end

    def self.by_something something, id
      [something.pluralize, id, self.name_for_path].join '/'
    end

    def self.by_params params
      params.map { |k, v| '%s=%s&' % [k, v] }.join
    end

    def self.get_url path, query = nil
      "%s%s?%s%s" % [Ultron::Config.instance.root_url, path, query, Ultron.auth(ENV['PRIVATE_KEY'], ENV['PUBLIC_KEY'])]
    end

    ###

    def initialize results_set
      @results_set = results_set
    end

    def [] key
      OpenStruct.new @results_set[key]
    end

    def each
      @results_set.each do |item|
        yield OpenStruct.new item
      end
    end
  end
end