module Ultron
  def self.get_url
    URI.join(
        Config.instance.config['host'],
        Config.instance.config['path']
    )
  end
end