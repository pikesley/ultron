module Ultron
  class Entities
    include Enumerable

    def self.name_for_path
      self.name.split('::')[-1].downcase
    end

    def self.connection
      @@connection ||= Ultron::Connection.new
    end

    def self.connection_reset!
      @@connection = nil
    end

    def self.path
      self.connection.path
    end

    def self.path= path
      self.connection.path = path
    end

    def self.find id
      self.path = [
          self.name_for_path,
          id
      ].join '/'
      OpenStruct.new self.perform['data']['results'][0]
    end

    def self.get
      self.path = self.name_for_path
      self.perform['data']['results']
    end

    def self.where params
      params.each_pair do |key, value|
        self.connection.add_params key => value
      end

      self.path = self.name_for_path
      self.new self.perform['data']['results']
    end

    def self.method_missing method_name, *args
      if method_name.to_s =~ /by_(.*)/
        self.send(:by_something, $1, args)
      end
    end

    def self.by_something something, id
      self.path = [
          something.pluralize,
          id,
          self.name_for_path
      ].join '/'
      self.new self.perform['data']['results']
    end

    def self.perform
      self.connection.perform
#      binding.pry
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