require 'spec_helper'

module Ultron
  describe 'exceptions' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should throw a 404 (wrapped in a Marvel exception) on a 404', :vcr do
      expect { Comics.find 1000000 }.to raise_exception { |exception| # there are not a million comics
        exception.should be_a MarvelException
        exception.code.should == 404
        exception.status.should == "We couldn't find that comic_issue"
      }
    end

    it 'should throw a No Idea What This Param Is exception', :vcr do
      expect { Characters.where(Thor: 'Mighty') }.to raise_exception { |exception|
        exception.should be_a MarvelException
        exception.code.should == 409
        exception.status.should == "We don't recognize the parameter Thor"
      }
    end

    it 'should throw an Ultron exception when we do something dumb', :vcr do
      expect { Comics.where offset: 1000000 }.to raise_exception { |exception|
        exception.status.should == 'The search returned no results'
      }
    end

    it 'should throw a Resource Not Found exception when we search for something nonsensical', :vcr do
      expect { Characters.by_creator 186 }.to raise_exception { |exception| # characters by creator is a nonsense concept in the Marvel API
        exception.status.should == 'Resource does not exist. Check http://developer.marvel.com/docs'
      }
    end

    it 'should throw a Resource Throttled Exception when we hit our limit', :vcr do
      pending 'Guess I need to stub this request'
      expect { Events.get }.to raise_exception { |exception|
        exception.status.should == 'You have exceeded your rate limit. Please try again later'
      }
    end

    after :each do
      Timecop.return
    end
  end
end