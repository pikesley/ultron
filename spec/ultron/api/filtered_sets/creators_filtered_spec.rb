require 'spec_helper'

module Ultron
  module API
    describe Creators do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of creators' do
        it 'by comic', :vcr do
          set     = Creators.new 'comics/40452/creators'
          creator = set[0]
          creator['id'].should == 361
          creator['fullName'].should == 'Cory Petit'
        end

        it 'by event', :vcr do
          creator = Creators.new('events/212/creators')[0]
          creator.class.should == Creator
          creator['id'].should == 1126
          creator['fullName'].should == 'Juan Santa Cruz'
        end

        it 'by series', :vcr do
          set = Creators.new 'series/1137/creators'
          set[0]['id'].should == 24
          set[0]['fullName'].should == 'Brian Michael Bendis'
        end

        it 'by story', :vcr do
          set     = Creators.new 'stories/49846/creators'
          creator = set[-1]
          creator['id'].should == 454
          creator['fullName'].should == 'Mark Morales'
        end
      end

      context 'should not generate lists of creators' do
        it 'filtered by character', :vcr do
          set = Creators.new 'character/4321/creators'
          set.any?.should == false
        end
      end

      after :each do
        Timecop.return
      end
    end
  end
end