require 'spec_helper'

module Ultron
  describe 'sample' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    context 'let us pick a random item' do
      it 'should get a count of items for a lookup', :vcr do
        total = Comics.by_character(1009610).metadata.total # All comics featuring Spider-Man
        expect(total).to eq (2576)
      end

      it 'should give us a random offset into the result set', :vcr do
        set = Comics.by_character 1009610
        allow(set).to receive(:random_offset).and_return(233)
        expect(set.random_offset).to eq (233)
      end

      it 'should give us a random comic', :vcr do
        set = Comics.by_character 1009610
        allow(set).to receive(:random_offset).and_return(512)
        expect(set.sample.title).to eq ('Amazing Spider-Man (1999) #590')
      end

      it 'should give us a random comic for a more complex search', :vcr do
        set = Comics.by_creator_and_with 214, dateRange: '1980-01-01,1989-12-31'
        allow(set).to receive(:random_offset).and_return(100)
        expect(set.sample.title).to eq ('Dazzler (1981) #19')
      end

      it 'should support sample as a class method', :vcr do
        skip 'I have no idea how to test this. Works, though'
      end
    end

    after :each do
      Timecop.return
    end
  end
end
