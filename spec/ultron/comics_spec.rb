require 'spec_helper'

module Ultron
  describe Comics do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end
    it 'should generate the right string for the URL path' do
      Comics.name_for_path.should == 'comics'
    end

    it 'find a comic', :vcr do
      @comic = Comics.find 12518
      @comic.title.should == 'Uncanny X-Men (1963) #67'
    end
  end
end