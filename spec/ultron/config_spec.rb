require 'spec_helper'

module Ultron
  describe Config do
    before :each do
      @conf = Ultron::Config.instance.config
    end
    it 'should have a host name' do
      @conf['host'].should == 'http://gateway.marvel.com'
    end

    it 'should have a url path' do
      @conf['path'].should == '/v1/public/'
    end

    it 'should let us add arbitrary keys' do
      @conf['doge'] = 'wow'
      @conf['doge'].should == 'wow'
    end

    it 'should give us OpenStruct-style attribute access' do
      @conf.host.should == 'http://gateway.marvel.com'
    end
  end
end