require 'spec_helper'

module Ultron
  module API
    describe Events do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of events' do
        it 'by character', :vcr do
          set = Events.new 'characters/1009368/events'
          event = set[-1]
          event.class.should == Event
          event['id'].should == 270
          event['title'].should == 'Secret Wars'
        end

        it 'by comic', :vcr do
          event = Events.new('comics/6669/events')[0]
          event['id'].should == 271
          event['title'].should == 'Secret Wars II'
        end

        it 'by creator', :vcr do
          set = Events.new 'creators/214/events'
          set[0]['id'].should == 116
          set[0]['title'].should == 'Acts of Vengeance!'
        end

        it 'by series', :vcr do
          set = Events.new 'series/489/events'
          event = set[0]
          event['id'].should == 32
          event['title'].should == 'Kings of Pain'
        end

        it 'by story', :vcr do
          set = Events.new 'stories/1203/events'
          event = set[0]
          event['id'].should == 238
          event['title'].should == 'Civil War'
        end
      end

      after :each do
        Timecop.return
      end
    end
  end
end