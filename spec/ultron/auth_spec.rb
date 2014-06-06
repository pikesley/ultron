require 'spec_helper'

module Ultron
  describe Ultron do
    context 'auth' do
      it 'should return the correct string' do
        Timecop.freeze '2014-02-08T21:20:00+00:00'
        expect(Ultron.auth('public', 'private')).to eq ('ts=1391894400&apikey=private&hash=7b0ecfd5af9875bc436cfd5ecc58ef3d')
        Timecop.return
      end
    end
  end
end
