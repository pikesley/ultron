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

      context 'should have the correct sets' do
        it 'comics', :vcr do
          @character.comics.class.should == Comics
        end

        it 'events', :vcr do
          @character.events.class.should == Events
      end

        it 'series', :vcr do
          @character.serieses.class.should == Serieses
        end

        it 'stories', :vcr do
          @character.stories.class.should == Stories
        end

        it 'not characters', :vcr do
          @character.characters.class.should == NilClass
        end

        it 'not creators', :vcr do
          @character.creators.class.should == NilClass
        end
      end

      it 'should have the correct name', :vcr do
        @character['name'].should == 'Phoenix'
      end

      it 'should not have any events', :vcr do
        @character.has_events?.should == false
      end
    end
  end
end