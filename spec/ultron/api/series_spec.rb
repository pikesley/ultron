require 'spec_helper'

module Ultron
  module API
    describe Series do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @comic = Ultron::API::Series.new 15280
      end

      after :each do
        Timecop.return
      end

      it 'should have the correct title', :vcr do
        @comic.title.should == 'Amazing Fantasy 15: Spider-Man! (2011 - 2012)'
      end
    end
  end
end