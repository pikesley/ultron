require 'spec_helper'

module Ultron
  module API
    describe Characters do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @characters = Ultron::API::Characters.new
      end

      after :each do
        Timecop.return
      end

      context 'get the first character off the list' do
        before :each do
          @character = @characters[0]
        end

        it 'should have the correct id', :vcr do
          @character['id'].should == 1009521
        end

        it 'should have the correct name', :vcr do
          @character['name'].strip.should == 'Hank Pym'
        end

        it 'should have the correct resourceURI', :vcr do
          @character['resourceURI'].should == 'http://gateway.marvel.com/v1/public/characters/1009521'
        end
      end

      context 'get a character by name' do
        before :each do
          @character = @characters.by_name('Hulk')
        end

        it 'should have the correct name', :vcr do
          @character['name'].should == 'Hulk'
        end

        it 'should have the correct id', :vcr do
          @character['id'].should == 1009351
        end
      end

      context 'get a character with a space in their name' do
        before :each do
          @character = @characters.by_name('Doctor Doom')
        end

        it 'should have the correct name', :vcr do
          @character['name'].should == 'Doctor Doom'
        end

        it 'should have the correct id', :vcr do
          @character['id'].should == 1009281
        end
      end
    end
  end
end