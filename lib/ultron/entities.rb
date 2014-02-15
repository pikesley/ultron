module Ultron
  class Entities
    include Enumerable

    def self.name_for_path
      self.name.split('::')[-1].downcase
    end

    def self.method_missing method_name, *args
      mname = method_name.to_s
      query = nil

      path  = self.name_for_path #if mname == 'get'
      path  = '%s/%s' % [path, args[0]] if mname == 'find'
      path  = self.send(:by_something, $1, args) if mname =~ /by_(.*)/

      query = self.send(:by_params, args) if mname == 'where'

      url = "%s%s?%s%s" % [
          Ultron.get_url,
          path,
          query,
          Ultron.auth(ENV['PRIVATE_KEY'], ENV['PUBLIC_KEY'])
      ]

      response = Ultron::Connection.perform url

      return OpenStruct.new response['data']['results'][0] if response['data']['results'].count == 1

      self.new response['data']['results']
    end

    def self.by_something something, id
      [
          something.pluralize,
          id,
          self.name_for_path
      ].join '/'
    end

    def self.by_params params
      p = ''

      params.each do |pair|
        parts = pair.flatten
        p << '%s=%s&' % [
           URI.encode(parts[0].to_s),
           URI.encode(parts[1])
        ]
      end

      p
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