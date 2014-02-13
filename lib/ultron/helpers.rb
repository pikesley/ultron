module Ultron
  def self.get_url s
    URI.join(
        Config.instance.config['host'],
        Config.instance.config['path'],
        s
    )
  end
end