require 'spec_helper'

module Ultron
  describe 'searching' do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end


    after :each do
      Timecop.return
      Entities.connection_reset!
    end
  end
end