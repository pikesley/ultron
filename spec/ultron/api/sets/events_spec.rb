require 'spec_helper'

module Ultron
  module API
    describe Events do
      before :each do
#        Config.instance.config['debug'] = true
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @events = Ultron::API::Events.new
      end

      after :each do
        Timecop.return
#        Config.instance.reset!
      end

      context 'get the second event off the list' do
        before :each do
          @event = @events[1]
        end

        it 'should have the right name', :vcr do
          @event['title'].should == 'Age of Apocalypse'
        end
      end

      it 'should give me a random event', :vcr do
        Events.stub(:random_id).and_return(233)
        event = Events.shuffle
        event.class.should == Event
        event['title'].should == 'Atlantis Attacks'
      end
    end
  end
end