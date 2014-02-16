require 'spec_helper'

module Ultron
  describe URL do
    context 'how should two URLs be equal?' do
      it 'should be equal regardless of the auth part', :vcr do
        ts = '2014-02-16T19:48:00+00:00'
        Timecop.freeze ts
        Ultron.stub(:auth).and_return(Date.parse(ts).strftime '%s')
        first_url = URL.new '/path/parts', 'query=string&'
        ts = '2014-02-17T19:48:00+00:00'
        Timecop.freeze ts
        second_url = URL.new '/path/parts', 'query=string&'

        first_url.should == second_url
      end
    end
  end
end