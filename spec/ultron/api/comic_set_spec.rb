require 'spec_helper'

module Ultron
  module API
    describe ComicSet do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @set = Ultron::API::ComicSet.new 'characters/1009496'
      end

      after :each do
        Timecop.return
      end

      it 'should have the correct first comic', :vcr do
        @set[0].title.should == 'Uncanny X-Force (2010) #13 (2nd Printing Variant)'
      end
    end
  end
end