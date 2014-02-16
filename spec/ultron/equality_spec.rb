require 'spec_helper'

module Ultron
  describe 'equality' do
    it 'should be equal if its URL (minus the auth bit) is equal', :vcr do
#      pending 'Because this throws Travis into a flat spin'
      Timecop.freeze '2014-02-16T00:00:00+00:00'
      a = Comics.by_character 1009472 # Nightcrawler

      Timecop.freeze '2014-02-15T00:00:00+00:00'
      b = Comics.by_character 1009472

      a.should == b
      Timecop.return
    end
  end
end