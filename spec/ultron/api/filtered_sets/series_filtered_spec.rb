require 'spec_helper'

module Ultron
  module API
    describe Serieses do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of serieses' do
        it 'by character', :vcr do
          @set = Serieses.new 'characters/1009368/series'
          @set.last['id'].should == 9086
          @set.last['title'].should == 'Avengers Academy (2010 - 2012)'
        end

        it 'by creator', :vcr do
          @set = Serieses.new 'creators/196/series'
          @set.first['id'].should == 2114
          @set.first['title'].should == 'All-Winners Comics (1941 - 1947)'
        end

        it 'by event', :vcr do
          @set = Serieses.new 'events/279/series'
          @set.last['id'].should == 9808
          @set.last['title'].should == 'X-Men: Second Coming - Revelations: Blind Science (2010)'
        end
      end

      it 'should not generate a list of series filtered by comic'
      it 'should not generate a list of series filtered by story'

      after :each do
        Timecop.return
      end
    end
  end
end