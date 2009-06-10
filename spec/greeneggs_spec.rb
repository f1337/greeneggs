require 'spec_helper'

describe 'Greeneggs' do
  it 'should display passing specs in green' do
    true.should.eql? true
  end

  it 'should display empty specs in yellow' do
  end

  it 'should display err-raising specs in purple/magenta' do
		raise 'this is a dummy error'
  end

  it 'should display failed specs in red' do
    should.flunk 'this is a dummy failure'
  end
end
