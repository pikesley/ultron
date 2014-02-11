require 'spec_helper'

module Ultron
  module API
    describe Comics do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
      end

      context 'generate filtered lists of comics' do
        it 'by character', :vcr do
          set   = Comics.new 'characters/1009496/comics'
          comic = set[0]
          comic.class.should == Comic
          comic['id'].should == 41839
          comic['title'].should == 'Uncanny X-Force (2010) #13 (2nd Printing Variant)'
        end

        it 'by creator', :vcr do
          set   = Comics.new 'creators/196/comics'
          comic = set[-1]
          comic.id.should == 46245
          comic['title'].should == 'Marvel Masterworks: Golden Age All-Winners (Trade Paperback)'
        end

        it 'by event', :vcr do
          comic = Comics.new('events/314/comics')[0]
          comic['id'].should == 48176
          comic['title'].should == 'Hunger (2013) #4'
        end

        it 'by series', :vcr do
          set = Comics.new 'series/3688/comics'
          comic = set[-1]
          comic['id'].should == 18830
          comic['title'].should == 'Spider-Man & Wolverine (2003) #4'
        end

        it 'by story', :vcr do
          comic = Comics.new('stories/3228/comics')[0]
          comic['id'].should == 5032
          comic.title.should == 'X-Men: The End Book 3: Men and X-Men (Trade Paperback)'
        end
      end

      after :each do
        Timecop.return
      end
    end
  end
end