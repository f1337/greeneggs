require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'GreenEggs terminal output' do
  it 'should display this passing specs in green' do
    true.should.eql? true
  end

  it 'should display this empty spec in yellow' do
  end

  it 'should display this error-raising spec in purple/magenta' do
		raise 'this is a dummy error'
  end

  it 'should display this failed spec in red' do
    should.flunk 'this is a dummy failure'
  end
end
