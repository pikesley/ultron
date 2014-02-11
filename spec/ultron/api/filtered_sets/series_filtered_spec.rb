require 'spec_helper'

module Ultron
  module API
    describe Serieses do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of serieses' do
        it 'by character', :vcr do
          set    = Serieses.new 'characters/1009368/series'
          series = set[-1]
          series.class.should == Series
          series['id'].should == 9086
          series['title'].should == 'Avengers Academy (2010 - 2012)'
        end

        it 'by creator', :vcr do
          series = Serieses.new('creators/196/series')[0]
          series['id'].should == 2114
          series['title'].should == 'All-Winners Comics (1941 - 1947)'
        end

        it 'by event', :vcr do
          set    = Serieses.new 'events/279/series'
          series = set[-1]
          series['id'].should == 9808
          series['title'].should == 'X-Men: Second Coming - Revelations: Blind Science (2010)'
        end
      end

      context 'should not generate lists of series' do
        it 'filtered by comic', :vcr do
          set = Serieses.new 'comics/5678/series'
          set.any?.should == false
        end
        it 'filtered by story', :vcr do
          set = Serieses.new 'stories/8765/series'
          set.any?.should == false
        end
      end


      after :each do
        Timecop.return
      end
    end
  end
end