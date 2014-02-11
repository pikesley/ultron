require 'spec_helper'

module Ultron
  module API
    describe Event do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @event = Ultron::API::Event.new 314
      end

      after :each do
        Timecop.return
      end

      context 'should have the correct sets' do
        it 'characters', :vcr do
          @event.characters.class.should == Characters
        end

        it 'series', :vcr do
          @event.serieses.class.should == Serieses
        end

        it 'stories', :vcr do
          @event.stories.class.should == Stories
        end

        it 'creators', :vcr do
          @event.creators.class.should == Creators
        end

        it 'not comics', :vcr do
          @event.comics.class.should == Comics
        end

        it 'events', :vcr do
          @event.events.class.should == NilClass
        end
      end

      it 'should have the correct title', :vcr do
        @event.title.should == 'Age of Ultron'
      end

      it 'should have the correct first character', :vcr do
        @event.characters[0].name.should == 'Ultron'
      end
    end
  end
end