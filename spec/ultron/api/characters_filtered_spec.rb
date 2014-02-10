require 'spec_helper'

module Ultron
  module API
    describe Characters do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of characters' do
        it 'by comic', :vcr do
          @set = Characters.new 'comics/29506/characters'
          @set.first['id'].should == 1009257
          @set.first['name'].should == 'Cyclops'
        end

        it 'by event', :vcr do
          @set = Characters.new 'events/116/characters'
          @set.last['id'].should == 1009282
          @set.last['name'].should == 'Doctor Strange'
        end

        it 'by series', :vcr do
          @set = Characters.new 'series/150/characters'
          @set[1]['id'].should == 1009368
          @set[1]['name'].should == 'Iron Man'
        end

        it 'by story', :vcr do
          @set = Characters.new 'stories/44081/characters'
          @set.first['id'].should == 1009726
          @set.first['name'].should == 'X-Men'
        end

        it 'should not generate a list of characters filtered by creator'

      end

      after :each do
        Timecop.return
      end
    end
  end
end