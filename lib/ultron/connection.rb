Dotenv.load

module Ultron
  class Connection
    def initialize type
      @type = type
    end

    def add_params h
      @params ||= {}
      h.each_pair do |key, value|
        @params[key] = URI.encode value
      end
    end

    def url
      u = "%s?%s" % [
          Ultron.get_url(@type),
          Ultron.auth(ENV['PRIVATE_KEY'], ENV['PUBLIC_KEY'])
      ]
      u = "%s&%s" % [u, ((@params.map { |k, v| "#{k}=#{v}" }).join '&')] if @params

      u
    end

    def perform
      c = Curl::Easy.new("%s" % url)
      c.headers = {
          'Accept' => 'application/json'
      }
      c.perform

#      binding.pry
      JSON.parse c.body_str
    end
  end
end