require 'spec_helper'

module Ultron
  module API
    describe Story do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @story = Ultron::API::Story.new 15820
      end

      after :each do
        Timecop.return
      end

      it 'should have the correct title', :vcr do
        @story.title.should == 'Cover #15820'
      end
    end
  end
end