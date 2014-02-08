require 'spec_helper'
module Ultron
  describe Characters do
    before :each do
      @characters = Ultron::Characters.new
    end

    it 'should have a url' do
      @characters.url.to_s.should == 'http://gateway.marvel.com/v1/public/characters'
    end
  end
end