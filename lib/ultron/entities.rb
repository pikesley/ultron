module Ultron
  class Entities
    def self.name_for_path
      self.name.split('::')[-1].downcase
    end

    def self.connection
      Ultron::Connection.new self.name_for_path
    end

    def self.find id
      c = self.connection
      c.path = 'comics/%s' % id
      @@results = c.perform
      OpenStruct.new @@results['data']['results'][0]
    end
  end
end