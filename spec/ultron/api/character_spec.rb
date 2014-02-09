require 'spec_helper'

module Ultron
  module API
    describe Character do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @character = Ultron::API::Character.new '1009496'
      end

      after :each do
        Timecop.return
      end

      it 'should have the correct name', :vcr do
        @character['name'].should == 'Phoenix'
      end

      it 'should have a comics set', :vcr do
        @character.comics.class.should == ComicSet
      end

      it 'should have an events set', :vcr do
        pending 'The EventSet is empty. Need to think about how to handle this'
        @character.events.class.should == EventSet
        @character.events[0].name.should == 'Derp'
      end

      it 'should have a series set', :vcr
      it 'should have a stories set', :vcr
    end
  end
end