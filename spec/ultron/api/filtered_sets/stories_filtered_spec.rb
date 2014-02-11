require 'spec_helper'

module Ultron
  module API
    describe Stories do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of stories' do
        it 'by character', :vcr do
          set = Stories.new 'characters/1009367/stories'
          story = set[0]
          story.class.should == Story
          story['id'].should == 5872
          story['title'].should == '1 of 7 - 7XLS'
        end

        it 'by comic', :vcr do
          story = Stories.new('comics/41540/stories')[0]
          story['id'].should == 93966
          story['title'].should == 'Cover #93966'
        end

        it 'by creator', :vcr do
          set = Stories.new 'creators/457/stories'
          story = set[-1]
          story['id'].should == 851
          story['title'].should == '1 of - Old Soldiers'
        end

        it 'by event', :vcr do
          set = Stories.new 'events/303/stories'
          story = set[0]
          story['id'].should == 80882
          story['title'].should == 'X-Men Legacy (2008) #247'
        end

        it 'by series', :vcr do
          set = Stories.new 'series/9981/stories'
          story = set[-1]
          story['id'].should == 74319
          story['title'].should == 'Interior #74319'
        end
      end

      after :each do
        Timecop.return
      end
    end
  end
end