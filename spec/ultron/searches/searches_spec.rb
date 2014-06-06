require 'spec_helper'

module Ultron
  describe 'searching' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should let us get a comic', :vcr do
      comic = Comics.find 10588
      expect(comic.title).to eq ('Secret Wars (1984) #6')
    end

    it 'should let us get comics by a creator', :vcr do
      comics = Comics.by_creator 196 # Jack Kirby
      expect(comics[14].title).to eq ('INHUMANS: THE ORIGIN OF THE INHUMANS TPB (Trade Paperback)')
    end

    it 'should let us search with parameters', :vcr do
      comics = Comics.where sharedAppearances: '1009351,1009718' # Hulk and Wolverine
      expect(comics[7].title).to eq ('Deadpool (2008) #37')
    end

    it 'should let us search with multiple parameters', :vcr do
      comics = Comics.where sharedAppearances: '1009610,1009718', events: 302 # Spider-Man and Wolverine, Fear Itself
      expect(comics.first.title).to eq ('Fear Itself (2010) #7')
    end

    it 'should accept with as a synonym for where', :vcr do
      comics = Comics.with sharedAppearances: '1009685,1009351' # Ultron and Hulk
      expect(comics.first.title).to eq ('Avengers: First to Last (Hardcover)')
    end

    it 'should let us get comics by a creator *with params*', :vcr do
      comics = Comics.by_creator_and_with 214, dateRange: '1980-01-01,1989-12-31'
      expect(comics.first.resourceURI).to eq ('http://gateway.marvel.com/v1/public/comics/8268')
    end

    it 'should let us get more than the default 20 results', :vcr do
      comics = Comics.where limit: 50
      expect(comics.count).to eq (50)
    end

    context 'pre-baked searches' do
      it 'should give us just regular comics', :vcr do
        comics = Comics.vanilla_comics
        expect(comics.first.id).to eq (47589)
        expect(comics.first.title).to eq ('Avengers A.I. (2013) #12')
        expect(comics.first.issueNumber).to eq (12)
      end

      it 'should give us regular comics filtered by character', :vcr do
        comics = Comics.by_character_and_vanilla_comics 1009685
        expect(comics.first.title).to eq ('AGE OF ULTRON (2013) #1')
      end

      it 'should barf on an unknown search', :vcr do
        begin
          comics = Comics.fake_search
        rescue Exception => e
          expect(e.class).to eq (NoMethodError)
        end
      end
    end

    after :each do
      Timecop.return
    end
  end
end
