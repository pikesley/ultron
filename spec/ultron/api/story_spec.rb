require 'spec_helper'

module Ultron
  module API
    describe Story do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @story = Ultron::API::Story.new 15820
      end

      context 'should have the correct sets' do
        it 'characters', :vcr do
          @story.characters.class.should == Characters
        end

        it 'comics', :vcr do
          @story.comics.class.should == Comics
        end

        it 'creators', :vcr do
          @story.creators.class.should == Creators
        end

        it 'events', :vcr do
          @story.events.class.should == Events
        end

        it 'series', :vcr do
          @story.serieses.class.should == Serieses
        end

        it 'not stories', :vcr do
          @story.stories.class.should == NilClass
        end
      end

      it 'should have the correct title', :vcr do
        @story.title.should == 'Cover #15820'
      end

      after :each do
        Timecop.return
      end
    end
  end
end