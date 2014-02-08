require 'spec_helper'
module Ultron
  describe Characters do
    before :each do
      @characters = Ultron::Characters.new
    end

    it 'should have a url' do
      @characters.url.should match /gateway.marvel.com/
    end
  end
end