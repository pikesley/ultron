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
    end
  end
end