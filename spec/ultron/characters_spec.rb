require 'spec_helper'
module Ultron
  describe Characters do
    before :each do
      @characters = Ultron::Characters.new
    end

    it 'should have a url' do
      @characters.url.to_s.should == 'http://gateway.marvel.com/v1/public/characters'
    end

    it 'should return a list of characters' do
      @characters.results.class.should == Array
    end

    it 'should have the correct first character', :vcr do
      @characters.results[0]['id'].should == 1009521
    end
  end
end