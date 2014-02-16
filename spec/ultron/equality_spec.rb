require 'spec_helper'

module Ultron
  describe 'equality' do
    it 'should be equal if its URL (minus the auth bit) is equal', :vcr do
      pending 'Because this throws Travis into a flat spin'
      Timecop.freeze '1970-01-01'
      a = Comics.by_character 1009472 # Nightcrawler

      Timecop.freeze '1974-06-15'
      b = Comics.by_character 1009472

      a.should == b
    end
  end
end