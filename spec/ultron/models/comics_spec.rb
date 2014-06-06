require 'spec_helper'

module Ultron
  describe Comics do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should generate the right string for the URL path' do
      expect(Comics.name_for_path).to eq ('comics')
    end

    it 'should find a comic', :vcr do
      comic = Comics.find 12518
      expect(comic.title).to eq ('Uncanny X-Men (1963) #67')
    end

    after :each do
      Timecop.return
    end
  end
end
