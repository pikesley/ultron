require 'spec_helper'

module Ultron
  describe 'exceptions' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should throw a 404 (wrapped in a Marvel exception) on a 404', :vcr do
      begin
        comic = Comics.find 1000000 # there are not a million comics
      rescue MarvelException => e
        e.code.should == 404
        e.status.should == "We couldn't find that comic_issue"
      end
    end

    it 'should throw a No Idea What This Param Is exception', :vcr do
      begin
        character = Characters.where Thor: 'Mighty'
      rescue MarvelException => e
        e.code.should == 409
        e.status.should == "We don't recognize the parameter Thor"
      end
    end

    it 'should throw an Ultron exception for something internal to Ultron', :vcr do
      begin
        comics = Comics.where offset: 1000000
      rescue UltronException => e
        e.status.should == 'The search returned no results'
      end
    end

    it 'should throw a Resource Not Found exception when we search for something nonsensical', :vcr do
      begin
        characters = Characters.by_creator 186 # characters by creator is a nonsense concept in the Marvel API
      rescue UltronException => e
        e.status.should == 'Resource does not exist. Check http://developer.marvel.com/docs'
      end
    end

    after :each do
      Timecop.return
    end
  end
end