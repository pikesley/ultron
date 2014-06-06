require 'spec_helper'

module Ultron
  describe Entities do
    it 'should parse params correctly' do
      hash = {thor: 'Mighty', hulk: 'Incredible'}
      expect(Entities.by_params(hash)).to eq ('thor=Mighty&hulk=Incredible&')
    end
  end
end
