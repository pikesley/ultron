require 'spec_helper'

module Ultron
  module API
    describe Comics do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @comics = Ultron::API::Comics.new
      end

      after :each do
        Timecop.return
      end

      context 'get the first comic off the list' do
        before :each do
          @comic = @comics[0]
        end

        it 'should have the correct id', :vcr do
          @comic['id'].should == 41530
        end

        it 'should have the correct title', :vcr do
          @comic['title'].strip.should == 'Ant-Man: So (Trade Paperback)'
        end

        it 'should have the correct resourceURI', :vcr do
          @comic['resourceURI'].should == 'http://gateway.marvel.com/v1/public/comics/41530'
        end
      end

      context 'parameterize the request', :vcr do
        it 'should let us set a limit', :vcr do
          @comics.add_params limit: 1
          @comics.length.should == 1
        end

        it 'should let us set a dateRange', :vcr do
          @comics.add_params dateRange: '1980-01-01,1990-01-01'
          @comics[0].title.should == 'Wolverine (1988) #20'
        end
      end
    end
  end
end