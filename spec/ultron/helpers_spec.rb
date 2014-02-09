require 'spec_helper'

module Ultron
  describe Ultron do
    context 'helpers' do
      it 'should return the correct url' do
        Ultron.get_url('doge').to_s.should == 'http://gateway.marvel.com/v1/public/doge'
      end

      it 'should extract the title correctly' do
        Ultron.title_extractor('Uncanny X-Men (1963) #67').should == 'Uncanny X-Men'
      end

      it 'should extract the year correctly' do
        Ultron.year_extractor('Uncanny X-Men (1963) #67').should == 1963
      end
    end
  end
end