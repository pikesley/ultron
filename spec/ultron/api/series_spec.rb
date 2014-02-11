require 'spec_helper'

module Ultron
  module API
    describe Series do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @series = Ultron::API::Series.new 15280
      end

      context 'should have the correct sets' do
        it 'characters', :vcr do
          @series.characters.class.should == Characters
        end

        it 'creators', :vcr do
          @series.creators.class.should == Creators
        end

        it 'events', :vcr do
          @series.events.class.should == Events
        end

        it 'not comics', :vcr do
          @series.comics.class.should == NilClass
        end

        it 'not series', :vcr do
          @series.serieses.class.should == NilClass
        end

        it 'not stories', :vcr do
          @series.stories.class.should == NilClass
        end
      end

      it 'should have the correct title', :vcr do
        @series.title.should == 'Amazing Fantasy 15: Spider-Man! (2011 - 2012)'
      end

      after :each do
        Timecop.return
      end
    end
  end
end