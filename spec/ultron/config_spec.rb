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
  end
end