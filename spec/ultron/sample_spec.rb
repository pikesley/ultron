require 'spec_helper'

module Ultron
  describe 'sample' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    context 'let us pick a random item' do
      it 'should get a count of items for a lookup', :vcr do
        total = Comics.by_character(1009610).metadata.total # All comics featuring Spider-Man
        total.should == 2576
      end

      it 'should give us a random offset into the result set', :vcr do
        set = Comics.by_character 1009610
        set.stub(:random_offset).and_return(233)
        set.random_offset.should == 233
      end

      it 'should give us a random comic', :vcr do
        set = Comics.by_character 1009610
        set.stub(:random_offset).and_return(512)
        set.sample.title.should == 'Amazing Spider-Man (1999) #590'
      end

      it 'should give us a random comic for a more complex search', :vcr do
        set = Comics.by_creator_and_with 214, dateRange: '1980-01-01,1989-12-31'
        set.stub(:random_offset).and_return(100)
        set.sample.title.should == 'Dazzler (1981) #19'
      end
    end

    after :each do
      Timecop.return
    end
  end
end