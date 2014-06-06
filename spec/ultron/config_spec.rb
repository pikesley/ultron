require 'spec_helper'

module Ultron
  describe Config do
    before :each do
      @conf = Ultron::Config.instance.config
    end
    it 'should have a host name' do
      expect(@conf['host']).to eq ('http://gateway.marvel.com')
    end

    it 'should have a url path' do
      expect(@conf['path']).to eq ('/v1/public/')
    end

    it 'should have a root url' do
      expect(Ultron::Config.instance.root_url).to eq ('http://gateway.marvel.com/v1/public/')
    end

    it 'should let us add arbitrary keys' do
      @conf['doge'] = 'wow'
      expect(@conf['doge']).to eq ('wow')
    end

    it 'should give us OpenStruct-style attribute access' do
      expect(@conf.host).to eq ('http://gateway.marvel.com')
    end
  end
end
