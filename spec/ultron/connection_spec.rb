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

    it 'should know how to URL-encode things', :vcr do
      @cnxn.add_params 'this' => 'has spaces'
      @cnxn.url.to_s.should match /&this=has%20spaces/
    end

    it 'should accept parameters in different hash notation', :vcr do
      @cnxn.add_params limit: 1
      @cnxn.url.to_s.should match /&limit=1/
    end
  end
end