module Ultron
  class Entities
    include Enumerable

    def self.name_for_path
      self.name.split('::')[-1].downcase
    end

    def self.method_missing method_name, *args
      path = self.name_for_path

  #    binding.pry
      mname = method_name.to_s
      if mname =~ /by_(.*)/
        path = self.send(:by_something, $1, args)
      end

      if mname == 'find'
        path = '%s/%s' % [
            path,
            args[0]
        ]
      end

      url = "%s%s?%s" % [
          Ultron.get_url,
          path,
          Ultron.auth(ENV['PRIVATE_KEY'], ENV['PUBLIC_KEY'])
      ]

      response = Ultron::Connection.perform url

      if mname == 'find'
        return OpenStruct.new response['data']['results'][0]
      end

      self.new response['data']['results']
    end

    def self.by_something something, id
      [
          something.pluralize,
          id,
          self.name_for_path
      ].join '/'
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