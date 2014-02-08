Dotenv.load

module Ultron
  class Connection
    def initialize s
      @url = Ultron.get_url 'characters'
    end

    def perform
      @url = "%s?%s" % [
          @url,
          Ultron.auth(ENV['PRIVATE_KEY'], ENV['PUBLIC_KEY'])
      ]
      c         = Curl::Easy.new("%s" % @url)
      c.headers = {
          'Accept' => 'application/json'
      }
      c.perform

      JSON.parse c.body_str
    end
  end
end