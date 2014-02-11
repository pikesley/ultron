require 'spec_helper'

module Ultron
  module API
    describe Serieses do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @serieses = Ultron::API::Serieses.new
      end

      after :each do
        Timecop.return
      end

      context 'get the third event off the list' do
        before :each do
          @series = @serieses[2]
        end

        it 'should have the right name', :vcr do
          @series['title'].should == '1602 (2003 - 2004)'
        end
      end
    end
  end
end