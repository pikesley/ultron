require 'spec_helper'

module Ultron
  module API
    describe Events do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of events' do
        it 'by character', :vcr do
          @set = Events.new 'characters/1009368/events'
          @set.last['id'].should == 270
          @set.last['title'].should == 'Secret Wars'
        end

        it 'by comic', :vcr do
          @set = Events.new 'comics/6669/events'
          @set.first['id'].should == 271
          @set.last['title'].should == 'Secret Wars II'
        end

        it 'by creator', :vcr do
          @set = Events.new 'creators/214/events'
          @set.first['id'].should == 116
          @set.first['title'].should == 'Acts of Vengeance!'
        end

        it 'by series', :vcr do
          @set = Events.new 'series/489/events'
          @set.first['id'].should == 32
          @set.first['title'].should == 'Kings of Pain'
        end

        it 'by story', :vcr do
          @set = Events.new 'stories/1203/events'
          @set.first['id'].should == 238
          @set.first['title'].should == 'Civil War'
        end
      end

      after :each do
        Timecop.return
      end
    end
  end
end