module Ultron
  class Entities
    def self.name_for_path
      name = self.name
      name_parts = name.split('::')
      basename = name_parts[-1]
      downcased = basename.downcase
      downcased
    end

    def self.connection
      Ultron::Connection.new self.name_for_path
    end

    def self.find id
      OpenStruct.new self.perform(id)['data']['results'][0]
    end

    def self.perform *args

      c = self.connection
      c.path = [
          self.name_for_path,
          args
      ].join '/'

      @@results = c.perform
    end
  end
end