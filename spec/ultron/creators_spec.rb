require 'spec_helper'

module Ultron
  describe Creators do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should generate the right string for the URL path' do
      Creators.name_for_path.should == 'creators'
    end

    it 'should find a list of series by the creator', :vcr do
      @creator = Creators.find 196
      @creator.fullName.should == 'Jack Kirby'
      @series = Series.by_creator 196
      @series[3].title.should == 'Amazing Fantasy (1962)'
      @series.class.should == Series
      @series.count.should == 20
    end

    after :each do
      Timecop.return
    end
  end
end