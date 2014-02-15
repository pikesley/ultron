Dotenv.load

module Ultron
  class Connection
    def self.perform url
      c         = Curl::Easy.new("%s" % url)
      c.headers = {
          'Accept'     => 'application/json',
          'User-agent' => 'Ultron v%s: https://rubygems.org/gems/ultron' % Ultron::VERSION
      }

      c.perform
      JSON.parse c.body_str
    end
  end
end