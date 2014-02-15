[![Build Status](http://img.shields.io/travis/pikesley/ultron.svg)](https://travis-ci.org/pikesley/ultron)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/ultron.svg)](https://gemnasium.com/pikesley/ultron)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/ultron.svg)](https://coveralls.io/r/pikesley/ultron)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/ultron.svg)](https://codeclimate.com/github/pikesley/ultron)
[![Gem Version](http://img.shields.io/gem/v/ultron.svg)](https://rubygems.org/gems/ultron)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-7/7-ff6799.svg)](https://github.com/pikesley/badger)

# Ultron

Ruby bindings for the [Marvel Comics API](http://developer.marvel.com/)

    git clone https://github.com/pikesley/ultron
    ultron
    bundle
    rake

To actually use it you need an API key and secret which you can get from [here](https://developer.marvel.com/signup), put them into `.env` like this

    PUBLIC_KEY: this_r_public_key
    PRIVATE_KEY: this_one_r_private_key

## API

I've tried to follow the [Marvel API](http://developer.marvel.com/docs#!/public/) as closely as possible. It's probably best illustrated with some examples from the [specs](https://github.com/pikesley/ultron/tree/master/spec/ultron):

### Get a thing by its ID

    it 'should find a comic', :vcr do
      comic = Comics.find 12518
      comic.title.should == 'Uncanny X-Men (1963) #67'
    end
    
### Get a set of things filtered by some other thing

    it 'should find a list of comics featuring the character', :vcr do
      character = Characters.find 1009610
      character.name.should == 'Spider-Man'
      comics = Comics.by_character 1009610
      comics.first.title.should == 'Superior Spider-Man (2013) #22'
      comics.class.should == Comics
      comics.count.should == 20
    end
    
### Get a set of things using query-string parameters

    it 'should let us search with parameters', :vcr do
      comics = Comics.where sharedAppearances: '1009351,1009718' # Hulk and Wolverine
      comics[7].title.should == 'Deadpool (2008) #37'
    end
    
### Get a set of things using multiple query-string parameters

    it 'should let us search with multiple parameters', :vcr do
      comics = Comics.where sharedAppearances: '1009610,1009718', events: 302 # Spider-Man and Wolverine, Fear Itself
      comics.first.title.should == 'Fear Itself (2010) #7'
    end

### Get a set of things filtered by another thing and with a query-string

    it 'should let us get comics by a creator *with params*', :vcr do
      comics = Comics.by_creator_and_with 214, dateRange: '1980-01-01,1989-12-31'
      comics.first.resourceURI.should == 'http://gateway.marvel.com/v1/public/comics/8268'
    end