module Ultron
  class Entities
    include Enumerable

    def self.name_for_path
      name = self.name
      name_parts = name.split('::')
      basename = name_parts[-1]
      downcased = basename.downcase
      downcased
    end

    def self.connection
      Ultron::Connection.new
    end

    def self.find id
      args = [
          self.name_for_path,
          id
      ]
      OpenStruct.new self.perform(args)['data']['results'][0]
    end

    def self.method_missing method_name, *args
      if method_name.to_s =~ /by_(.*)/
        self.send(:by_something, $1, args)
      end
    end

    def self.by_something something, id
      args = [
          something,
          id,
          self.name_for_path
      ].join '/'
      self.new self.perform(args)['data']['results']
    end

    def self.perform *args
      c = self.connection
      c.path = args.join '/'
      c.perform
    end

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