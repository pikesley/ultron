require 'spec_helper'

module Ultron
  module API
    describe Characters do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of characters' do
        it 'by comic', :vcr do
          set  = Characters.new 'comics/29506/characters'
          char = set[0]
          char.class.should == Character
          char['id'].should == 1009257
          char['name'].should == 'Cyclops'
        end

        it 'by event', :vcr do
          set  = Characters.new 'events/116/characters'
          char = set[-1]
          char['id'].should == 1009282
          char['name'].should == 'Doctor Strange'
        end

        it 'by series', :vcr do
          char = Characters.new('series/150/characters')[1]
          char.class.should == Character
          char['id'].should == 1009368
          char['name'].should == 'Iron Man'
        end

        it 'by story', :vcr do
          set  = Characters.new 'stories/44081/characters'
          char = set[0]
          char['id'].should == 1009726
          char['name'].should == 'X-Men'
        end
      end

      context 'should not generate lists of characters' do
        it 'filtered by creator', :vcr do
          set = Characters.new 'creators/1234/characters'
          set.any?.should == false
        end
      end

      after :each do
        Timecop.return
      end
    end
  end
end