require 'spec_helper'

module Ultron
  describe Entities do
    it 'should parse params correctly' do
      hash = {thor: 'Mighty', hulk: 'Incredible'}
      Entities.by_params(hash).should == 'thor=Mighty&hulk=Incredible&'
    end
  end
end