require 'spec_helper'

module Ultron
  describe Ultron do
    it 'should return the correct url' do
      Ultron.get_url('doge').to_s.should == 'http://gateway.marvel.com/v1/public/doge'
    end
  end
end