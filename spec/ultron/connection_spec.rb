require 'spec_helper'

module Ultron
  describe Connection do
    before :each do
      Timecop.freeze '2014-02-08T21:20:00+00:00'
      @cnxn = Ultron::Connection.new 'characters'
    end

    after :each do
      Timecop.return
    end

    it 'should get a 200', :vcr do
      @cnxn.perform['code'].should == 200
    end

    it 'should accept additional params', :vcr do
      @cnxn.add_params 'foo' => 'bar'
      @cnxn.url.to_s.should match /&foo=bar/
    end
  end
end