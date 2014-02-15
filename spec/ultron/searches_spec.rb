require 'spec_helper'

module Ultron
  describe 'searching' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should let us get a comic', :vcr do
      comic = Comics.find 10588
      comic.title.should == 'Secret Wars (1984) #6'
    end

    it 'should let us get comics by a creator', :vcr do
      comics = Comics.by_creator 196 # Jack Kirby
      comics[14].title.should == 'INHUMANS: THE ORIGIN OF THE INHUMANS TPB (Trade Paperback)'
    end

    it 'should let us search with parameters', :vcr do
      comics = Comics.where sharedAppearances: '1009351,1009718'
      comics[7].title.should == 'Deadpool (2008) #37'
    end

    after :each do
      Timecop.return
    end
  end
end