module Ultron
  def self.get_url s
    URI.join(
        Config.instance.config['host'],
        Config.instance.config['path'],
        s
    )
  end

  def self.auth private_key, public_key
    timestamp = Time.new.strftime '%s'

    digest = Digest::MD5.hexdigest '%s%s%s' % [
        timestamp,
        private_key,
        public_key
    ]

    'ts=%s&apikey=%s&hash=%s' % [
        timestamp,
        public_key,
        digest
    ]
  end
end