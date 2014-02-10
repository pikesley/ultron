require 'spec_helper'

module Ultron
  module API
    describe Creators do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of creators' do
        it 'by comic', :vcr do
          @set = Creators.new 'comics/40452/creators'
          @set.first['id'].should == 361
          @set.first['fullName'].should == 'Cory Petit'
        end

        it 'by event', :vcr do
          @set = Creators.new 'events/212/creators'
          @set.first['id'].should == 1126
          @set.first['fullName'].should == 'Juan Santa Cruz'
        end

        it 'by series', :vcr do
          @set = Creators.new 'series/1137/creators'
          @set.first['id'].should == 24
          @set.first['fullName'].should == 'Brian Michael Bendis'
        end

        it 'by story', :vcr do
          @set = Creators.new 'stories/49846/creators'
          @set.last['id'].should == 454
          @set.last['fullName'].should == 'Mark Morales'
        end
      end

      it 'should not generate a list of creators filtered by character'

      after :each do
        Timecop.return
      end
    end
  end
end