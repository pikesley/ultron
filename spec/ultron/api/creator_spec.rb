require 'spec_helper'

module Ultron
  module API
    describe Creator do
      before :each do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        @creator = Ultron::API::Creator.new 196
      end

      after :each do
        Timecop.return
      end

      it 'should have the correct name', :vcr do
        @creator.fullName.should == 'Jack Kirby'
      end

      it 'should have a comics set', :vcr do
        @creator.comics.class.should == ComicsSet
        @creator.comics[0].title.should == 'THE FANTASTIC FOUR OMNIBUS VOL. 2 HC (NEW PRINTING) (Hardcover)'
      end
    end
  end
end