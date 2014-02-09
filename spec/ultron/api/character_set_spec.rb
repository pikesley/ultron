require 'spec_helper'

module Ultron
  module API
    describe CharacterSet do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @set = Ultron::API::CharacterSet.new 'comics/29506'
      end

      after :each do
        Timecop.return
      end

      it 'should have the correct first character', :vcr do
        @set[0]['id'].should == 1009257
      end
    end
  end
end