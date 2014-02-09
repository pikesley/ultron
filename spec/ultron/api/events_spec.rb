require 'spec_helper'

module Ultron
  module API
    describe Events do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @events = Ultron::API::Events.new
      end

      after :each do
        Timecop.return
      end

      context 'get the second event off the list' do
        before :each do
          @event = @events[1]
        end

        it 'should have the right name', :vcr do
          @event.title.should == 'Age of Apocalypse'
        end
      end
    end
  end
end