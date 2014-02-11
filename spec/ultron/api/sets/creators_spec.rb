require 'spec_helper'

module Ultron
  module API
    describe Creators do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @creators = Ultron::API::Creators.new
      end

      after :each do
        Timecop.return
      end

      context 'get the second creator off the list' do
        before :each do
          @creators.add_params offset: 600
          @creator = @creators[1]
        end

        it 'should have the right name', :vcr do
          @creator['fullName'].should == 'Nicholas Bertozzi'
        end
      end

#      it 'should have the correct total', :vcr do
#        @creators.metadata['total'].should == 5558
#      end
    end
  end
end