require 'spec_helper'

module Ultron
  describe Series do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

 #   it 'should give a default set of series', :vcr do
 #     series = Series.get
 #     series.count.should == 20
 #   end

    after :each do
      Timecop.return
    end
  end
end