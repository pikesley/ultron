require 'spec_helper'

module Ultron
  describe Config do
    it 'should have a host name' do
      Ultron::Config.instance.config['host'].should == 'http://gateway.marvel.com'
    end
  end
end