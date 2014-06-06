require 'spec_helper'

module Ultron
  describe 'equality' do
    it 'should be equal if its URL (minus the auth bit) is equal', :vcr do
#      pending 'Because this throws Travis into a flat spin'
      Timecop.freeze '1970-01-01T00:00:00+00:00'
      a = Comics.by_character 1009472 # Nightcrawler

      Timecop.freeze '1974-06-15T00:00:00+00:00'
      b = Comics.by_character 1009472

      expect(a).to eq (b)
      Timecop.return
    end
  end
end
