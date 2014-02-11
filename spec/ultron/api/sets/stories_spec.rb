require 'spec_helper'

module Ultron
  module API
    describe Stories do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @stories = Ultron::API::Stories.new
      end

      after :each do
        Timecop.return
      end

      context 'get the second story off the list' do
        before :each do
          @story = @stories[1]
        end

        it 'should have the right name', :vcr do
          @story['title'].should match /Investigating the murder of a teenage girl, Cage suddenly learns/
        end
      end
    end
  end
end