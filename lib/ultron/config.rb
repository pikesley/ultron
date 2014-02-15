module Ultron
  class Config
    include Singleton

    def initialize
      reset!
    end

    def reset! # testing a singleton is hard
      @config = OpenStruct.new fetch_yaml 'ultron'
    end

    def config
      @config
    end

    def root_url
      URI.join(
          Config.instance.config['host'],
          Config.instance.config['path']
      ).to_s
    end

    private

    def fetch_yaml file
      YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/%s.yaml' % file)))
    end
  end
end