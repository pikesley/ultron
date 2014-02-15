Dotenv.load

module Ultron
  class Connection
    def self.perform url
      c         = Curl::Easy.new("%s" % url)
      c.headers = {
          'Accept'     => 'application/json',
          'User-agent' => 'Ultron v%s: https://rubygems.org/gems/ultron' % Ultron::VERSION
      }

  #    if Config.instance.config['debug']
  #      puts '>>> Hitting %s' % url
  #    end

      c.perform
      JSON.parse c.body_str
    end
  end
end