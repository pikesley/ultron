require 'spec_helper'

module Ultron
  module API
    describe Comics do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of comics' do
        it 'by character', :vcr do
          @set = Ultron::API::Comics.new 'characters/1009496/comics'
          @set.first['id'].should == 41839
          @set.first['title'].should == 'Uncanny X-Force (2010) #13 (2nd Printing Variant)'
        end

        it 'by creator', :vcr do
          @set = Ultron::API::Comics.new 'creators/196/comics'
          @set.last['id'].should == 46246
          @set.last['title'].should == 'Marvel Masterworks: Golden Age All-Winners (Trade Paperback)'
        end

        it 'by event', :vcr do
          @set = Ultron::API::Comics.new 'events/314/comics'
          @set.first['id'].should == 48176
          @set.first['title'].should == 'Hunger (2013) #4'
        end

        it 'by series', :vcr do
          @set = Ultron::API::Comics.new 'series/3688/comics'
          @set.last['id'].should == 18828
          @set.last['title'].should == 'Spider-Man & Wolverine (2003) #2'
        end

        it 'by stories', :vcr do
          @set = Ultron::API::Comics.new 'stories/3228/comics'
          @set.first['id'].should == 5032
          @set.first['title'].should == 'X-Men: The End Book 3: Men and X-Men (Trade Paperback)'
        end
      end

      after :each do
        Timecop.return
      end
    end
  end
end