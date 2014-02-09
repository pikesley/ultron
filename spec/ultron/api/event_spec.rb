require 'spec_helper'

module Ultron
  module API
    describe Event do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @event = Ultron::API::Event.new 314
      end

      after :each do
        Timecop.return
      end

      it 'should have the correct title', :vcr do
        @event.title.should == 'Age of Ultron'
      end

      it 'should have a list of characters', :vcr do
        @event.characters.class.should == CharacterSet
        @event.characters[0].name.should == 'Ultron'
      end
    end
  end
end