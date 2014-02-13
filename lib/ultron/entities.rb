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
      c = self.connection
      c.path = '%s/%s' % [
          self.name_for_path,
          id
      ]
      @@results = c.perform
      OpenStruct.new @@results['data']['results'][0]
    end
  end
end