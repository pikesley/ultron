require 'spec_helper'

module Ultron
  describe Creators do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should generate the right string for the URL path' do
      expect(Creators.name_for_path).to eq ('creators')
    end

    it 'should find a list of series by the creator', :vcr do
      creator = Creators.find 196
      expect(creator.fullName).to eq ('Jack Kirby')
      series = Series.by_creator 196
      expect(series[3].title).to eq ('Amazing Fantasy (1962)')
      expect(series.class).to eq (Series)
      expect(series.count).to eq (20)
    end

    after :each do
      Timecop.return
    end
  end
end
