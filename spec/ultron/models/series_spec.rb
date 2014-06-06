require 'spec_helper'

module Ultron
  describe Series do
    before :each do
      Timecop.freeze '2014-02-13T18:47:24+00:00'
    end

    it 'should give a default set of series', :vcr do
      series = Series.get
      expect(series.count).to eq (20)
    end

    it 'should give us a larger set of series', :vcr do
      series = Series.get_and_with limit: 50
      expect(series.count).to eq (50)
    end

    it 'should not accept any old method', :vcr do
      begin
        series = Series.derp
      rescue Exception => e
        expect(e.class).to eq (NoMethodError)
      end
    end

    after :each do
      Timecop.return
    end
  end
end
