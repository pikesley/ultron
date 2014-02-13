require 'spec_helper'

module Ultron
  describe Characters do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should generate the right string for the URL path' do
      Characters.name_for_path.should == 'characters'
    end

    it 'should find a character', :vcr do
      @character = Characters.find 1009685
      @character.name.should == 'Ultron'
    end

    it 'should find a list of comics featuring the character', :vcr do
      @character = Characters.find 1009610
      @character.name.should == 'Spider-Man'
      @comics = Comics.by_character 1009610
      @comics.first.title.should == 'Superior Spider-Man (2013) #22'
      @comics.class.should == Comics
      @comics.count.should == 20
    end

    after :each do
      Timecop.return
    end
  end
end