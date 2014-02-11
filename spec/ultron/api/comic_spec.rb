require 'spec_helper'

module Ultron
  module API
    describe Comic do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @comic = Ultron::API::Comic.new 12518
      end

      after :each do
        Timecop.return
      end

      context 'should have the correct sets' do
        it 'characters', :vcr do
          @comic.characters.class.should == Characters
        end

        it 'events', :vcr do
          @comic.events.class.should == Events
        end

        it 'series', :vcr do
          @comic.serieses.class.should == Serieses
        end

        it 'stories', :vcr do
          @comic.stories.class.should == Stories
        end

        it 'creators', :vcr do
          @comic.creators.class.should == Creators
        end

        it 'not comics', :vcr do
          @comic.comics.class.should == NilClass
        end
      end

      it 'should have the correct title', :vcr do
        @comic.title.should == 'Uncanny X-Men (1963) #67'
      end

      it 'should have openstruct method-style attribute accessors', :vcr do
        @comic.issueNumber.should == 67
      end
    end
  end
end