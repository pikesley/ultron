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
        @character.comics.class.should == Comics
      end

      it 'should have an events set', :vcr do
        @character.events.class.should == Events
        @character.has_events?.should == false
      end

      it 'should have a series set', :vcr do
        pending "This doesn't exist yet"
        @character.serieses.class.should == SeriesSet
      end
      it 'should have a stories set', :vcr
    end
  end
end