require 'spec_helper'

module Ultron
  describe Connection do
    before :each do
      @cnxn = Ultron::Connection.new 'characters'
      Timecop.freeze '2014-02-08T21:20:00+00:00'
    end

    after :each do
      Timecop.return
    end

    it 'should get a 200', :vcr do
      @cnxn.perform['code'].should == 200
    end
  end
end