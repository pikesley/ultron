module Ultron
  class Config

    include Singleton

    def initialize
      reset!
    end

    def reset!
      @config = fetch_yaml 'ultron'
    end

    def config
      @config
    end

    private

    def fetch_yaml file
      YAML.load(
          File.open(
              File.join(
                  File.dirname(__FILE__),
                  '..',
                  '..',
                  'config/%s.yaml' % [
                      file
                  ]
              )
          )
      )
    end
  end
end