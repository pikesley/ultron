require 'spec_helper'
module Ultron
  describe Characters do
    before :each do
      @characters = Ultron::Characters.new
      Timecop.freeze '2014-02-08T21:20:00+00:00'
    end

    after :each do
      Timecop.return
    end

    context 'get a character' do
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
  end
end