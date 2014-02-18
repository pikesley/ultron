require 'spec_helper'

module Ultron
  describe 'searching' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should let us get a comic', :vcr do
      comic = Comics.find 10588
      comic.title.should == 'Secret Wars (1984) #6'
    end

    it 'should let us get comics by a creator', :vcr do
      comics = Comics.by_creator 196 # Jack Kirby
      comics[14].title.should == 'INHUMANS: THE ORIGIN OF THE INHUMANS TPB (Trade Paperback)'
    end

    it 'should let us search with parameters', :vcr do
      comics = Comics.where sharedAppearances: '1009351,1009718' # Hulk and Wolverine
      comics[7].title.should == 'Deadpool (2008) #37'
    end

    it 'should let us search with multiple parameters', :vcr do
      comics = Comics.where sharedAppearances: '1009610,1009718', events: 302 # Spider-Man and Wolverine, Fear Itself
      comics.first.title.should == 'Fear Itself (2010) #7'
    end

    it 'should accept with as a synonym for where', :vcr do
      comics = Comics.with sharedAppearances: '1009685,1009351' # Ultron and Hulk
      comics.first.title.should == 'Avengers: First to Last (Hardcover)'
    end

    it 'should let us get comics by a creator *with params*', :vcr do
      comics = Comics.by_creator_and_with 214, dateRange: '1980-01-01,1989-12-31'
      comics.first.resourceURI.should == 'http://gateway.marvel.com/v1/public/comics/8268'
    end

    it 'should let us get more than the default 20 results', :vcr do
      comics = Comics.where limit: 50
      comics.count.should == 50
    end

    context 'pre-baked searches' do
      it 'should give us just regular comics', :vcr do
        comics = Comics.vanilla_comics
        comics.first.id.should == 47589
        comics.first.title.should == 'Avengers A.I. (2013) #12'
        comics.first.issueNumber.should == 12
      end

      it 'should give us regular comics filtered by character', :vcr do
        comics = Comics.by_character_and_vanilla_comics 1009685
        comics.first.title.should == 'AGE OF ULTRON (2013) #1'
      end

      it 'should barf on an unknown search', :vcr do
        begin
          comics = Comics.fake_search
        rescue Exception => e
          e.class.should == NoMethodError
        end
      end
    end

    after :each do
      Timecop.return
    end
  end
end