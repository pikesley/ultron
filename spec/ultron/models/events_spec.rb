require 'spec_helper'

module Ultron
  describe Events do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should generate the right string for the URL path' do
      Events.name_for_path.should == 'events'
    end

    it 'should find a list of stories for the event', :vcr do
      event = Events.find 271
      event.title.should == 'Secret Wars II'
      stories = Stories.by_event 271
      stories[4].title.should == 'Doctor Doom Versus the Beyonder'
      stories[4].id.should == 12850
      stories.class.should == Stories
    end

    after :each do
      Timecop.return
    end
  end
end