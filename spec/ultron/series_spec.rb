require 'spec_helper'

module Ultron
  describe Series do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should give a default set of series', :vcr do
      series = Series.get
      series.count.should == 20
    end

    it 'should let us search with parameters', :vcr do
      series = Series.where title: 'Uncanny X-Men'
      series[2].title.should == 'Uncanny X-Men (2011 - 2012)'
    end

    after :each do
      Series.connection_reset!
      Timecop.return
    end
  end
end