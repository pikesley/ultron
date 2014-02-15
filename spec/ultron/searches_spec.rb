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

    it 'should throw a Not Found exception', :vcr do
      begin
        comic = Comics.find 1000000 # there are not a million comics
      rescue NotFoundException => e
        e.code.should == 404
        e.status.should == "We couldn't find that comic_issue"
      end
    end

    it 'should throw a No Results exception', :vcr do
      begin
        comics = Comics.where offset: 1000000
      rescue NoResultsException => e
        e.status.should == 'That search returned no results'
      end
    end

    after :each do
      Timecop.return
    end
  end
end