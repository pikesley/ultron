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

#    it 'should return a list of characters' do
#      @characters.results.class.should == Array
#    end

    it 'should have the correct first character', :vcr do
      @characters[0]['id'].should == 1009521
    end
  end
end