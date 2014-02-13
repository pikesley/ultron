require 'spec_helper'

module Ultron
  describe Connection do
    before :each do
      Timecop.freeze '2014-02-08T21:20:00+00:00'
      @cnxn = Ultron::Connection.new
      @cnxn.path = 'characters'
    end

    it 'should have the correct url', :vcr do
      @cnxn.url.should match /http:\/\/gateway.marvel.com\/v1\/public\/characters/
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

    it 'should let us specify a different path', :vcr do
      @cnxn.path = 'comics'
      @cnxn.url.should match /http:\/\/gateway.marvel.com\/v1\/public\/comics/
    end

    after :each do
      Timecop.return
    end
  end
end