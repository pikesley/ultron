Dotenv.load

module Ultron
  class Connection
    attr_accessor :path

    def add_params h
      @params ||= {}
      h.each_pair do |key, value|
        @params[key] = URI.encode value.to_s
      end
    end

    def remove_param p
      @params ||= {}
      @params.delete p
    end

    def url
      @url || begin
        url = "%s?%s" % [
            Ultron.get_url(@path),
            Ultron.auth(ENV['PRIVATE_KEY'], ENV['PUBLIC_KEY'])
        ]
        url = "%s&%s" % [url, ((@params.map { |k, v| "#{k}=#{v}" }).join '&')] if @params

        url
     end
    end

    def self.perform url
      c = Curl::Easy.new("%s" % url)
      c.headers = {
          'Accept' => 'application/json'
      }
      if Config.instance.config['debug']
        puts '>>> Hitting %s' % url
      end
      c.perform

      JSON.parse c.body_str
    end
  end
end