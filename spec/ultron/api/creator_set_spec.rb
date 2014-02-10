require 'spec_helper'

module Ultron
  module API
    describe Creators do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @set = Ultron::API::Creators.new 'creators/186/comics'
      end

      after :each do
        Timecop.return
      end

      it 'should have the correct first comic', :vcr do
        pending 'refactoring around this'
        @set[0].title.should == 'Uncanny X-Force (2010) #13 (2nd Printing Variant)'
      end
    end
  end
end