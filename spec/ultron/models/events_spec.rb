require 'spec_helper'

module Ultron
  describe Events do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should generate the right string for the URL path' do
      expect(Events.name_for_path).to eq ('events')
    end

    it 'should find a list of stories for the event', :vcr do
      event = Events.find 271
      expect(event.title).to eq ('Secret Wars II')
      stories = Stories.by_event 271
      expect(stories[4].title).to eq ('Doctor Doom Versus the Beyonder')
      expect(stories[4].id).to eq (12850)
      expect(stories.class).to eq (Stories)
    end

    after :each do
      Timecop.return
    end
  end
end
