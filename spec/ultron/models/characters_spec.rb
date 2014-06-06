require 'spec_helper'

module Ultron
  describe Characters do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should generate the right string for the URL path' do
      expect(Characters.name_for_path).to eq ('characters')
    end

    it 'should find a character', :vcr do
      character = Characters.find 1009685
      expect(character.name).to eq ('Ultron')
    end

    it 'should find a list of comics featuring the character', :vcr do
      character = Characters.find 1009610
      expect(character.name).to eq ('Spider-Man')
      comics = Comics.by_character 1009610
      expect(comics.first.title).to eq ('Superior Spider-Man (2013) #22')
      expect(comics.class).to eq (Comics)
      expect(comics.count).to eq (20)
    end

    after :each do
      Timecop.return
    end
  end
end
