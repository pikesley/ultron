require 'spec_helper'

module Ultron
  describe Comic do
    before :each do
      Timecop.freeze '2014-02-08T21:20:00+00:00'
      @comic = Ultron::Comic.new 12518
    end

    it 'should have the correct title', :vcr do
      @comic.title.should == 'Uncanny X-Men'
    end

    it 'should have the correct year', :vcr do
      @comic.year.should == 1963
    end
  end
end