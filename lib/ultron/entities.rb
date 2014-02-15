module Ultron
  class Entities
    include Enumerable

    def self.find id
      path     = self.name_for_path
      path     = '%s/%s' % [path, id]
      url      = get_url path
      response = self.response url
      case response['code'].to_i
        when 404
          raise MarvelException.new response

        else
          set = self.new response['data'], url
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

      url      = get_url path, query
      response = self.response url
      unless response['data']['results'].any?
        raise UltronException.new 'That search returned no results'
      end
      self.new response['data'], url
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

    def self.response url
      Ultron::Connection.perform url
    end

    def self.name_for_path
      self.name.split('::')[-1].downcase
    end

    ###

    attr_reader :metadata

    def initialize data, url
      @results_set = data['results']
      @metadata    = OpenStruct.new data
      @url         = url
    end

    def [] key
      OpenStruct.new @results_set[key]
    end

    def each
      @results_set.each do |item|
        yield OpenStruct.new item
      end
    end

    def random_offset
      Random.rand @metadata.total
    end

    def sample
      sample_params = '&offset=%d&limit=1' % random_offset
      full_url = '%s%s' % [@url, sample_params]
      response = Ultron::Connection.perform full_url
      self.class.new(response['data'], full_url).first
    end
  end
end