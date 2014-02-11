[![Build Status](http://img.shields.io/travis/pikesley/ultron.svg)](https://travis-ci.org/pikesley/ultron)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/ultron.svg)](https://gemnasium.com/pikesley/ultron)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/ultron.svg)](https://coveralls.io/r/pikesley/ultron)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/ultron.svg)](https://codeclimate.com/github/pikesley/ultron)
[![Gem Version](http://img.shields.io/gem/v/ultron.svg)](https://rubygems.org/gems/ultron)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-7/7-ff6799.svg)](https://github.com/pikesley/badger)

# Ultron

Wrapping some Ruby around the [Marvel Comics API](http://developer.marvel.com/)

    git clone https://github.com/pikesley/ultron
    ultron
    bundle
    rake

Look at the [specs](https://github.com/pikesley/ultron/blob/master/spec/ultron/) to see what it's actually doing - I'm knocking things off one-at-a-time from [this list](http://developer.marvel.com/docs#!/public/).

To actually use it you need an API key and secret which you can get from [here](https://developer.marvel.com/signup), put them into `.env` like this

    PUBLIC_KEY: this_r_public_key
    PRIVATE_KEY: this_one_r_private_key

## Alpha alpha alpha

I'm working this out as I go along, my API is liable to get bent out of all recognition before I'm done.