require 'spec_helper'

module Ultron
  module API
    describe Creator do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @creator = Ultron::API::Creator.new 196
      end

      context 'it should have the correct sets' do
        it 'comics', :vcr do
          @creator.comics.class.should == Comics
        end

        it 'events', :vcr do
          @creator.events.class.should == Events
        end

        it 'serieses', :vcr do
          @creator.serieses.class.should == Serieses
        end

        it 'stories', :vcr do
          @creator.stories.class.should == Stories
        end

        it 'not characters', :vcr do
          @creator.characters.class.should == NilClass
        end

        it 'not creators', :vcr do
          @creator.creators.class.should == NilClass
        end
      end

      it 'should have the correct name', :vcr do
        @creator['fullName'].should == 'Jack Kirby'
      end

      it 'should have the correct comic', :vcr do
        @creator.comics[0]['title'].should == 'THE FANTASTIC FOUR OMNIBUS VOL. 2 HC (NEW PRINTING) (Hardcover)'
      end

      after :each do
        Timecop.return
      end
    end
  end
end