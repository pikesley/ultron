require 'spec_helper'

module Ultron
  describe 'exceptions' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should throw a Not Found exception', :vcr do
      begin
        comic = Comics.find 1000000 # there are not a million comics
      rescue NotFoundException => e
        e.code.should == 404
        e.status.should == "We couldn't find that comic_issue"
      end
    end

    it 'should throw a No Results exception', :vcr do
      begin
        comics = Comics.where offset: 1000000
      rescue NoResultsException => e
        e.status.should == 'That search returned no results'
      end
    end

    it 'should throw a No Idea What This Param Is exception'

    after :each do
      Timecop.return
    end
  end
end