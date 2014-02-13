require 'spec_helper'

module Ultron
  describe Characters do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should generate the right string for the URL path' do
      Characters.name_for_path.should == 'characters'
    end

    it 'find a character', :vcr do
      @character = Characters.find 1009685
      @character.name.should == 'Ultron'
    end

    after :each do
      Timecop.return
    end
  end
end