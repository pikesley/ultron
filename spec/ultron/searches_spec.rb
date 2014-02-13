require 'spec_helper'

module Ultron

  describe 'searching' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should let us search with parameters', :vcr do
      series = Series.where title: 'Uncanny X-Men'
      series[2].title.should == 'Uncanny X-Men (2011 - 2012)'
    end

    it 'should let us search with multiple parameters', :vcr do
      series = Series.where characters: 1009685, events: 270
      puts series.first.title.should == 'Secret Wars (1984 - 1985)'
    end

    after :each do
      Timecop.return
      Entities.connection_reset!
    end
  end
end