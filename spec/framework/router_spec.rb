require 'framework/router'


RSpec.describe Framework::Router do
  subject{ described_class.new() }
  before :each do
    @env = {
      'REQUEST_METHOD' => 'GET',
      'PATH_INFO' => '/method'
    }
    subject.get(@env['PATH_INFO'], {to: DummyActionable})
  end

  it 'should have get method' do
    expect(subject.routes).to be_kind_of Hash
  end

  it 'should have call method' do
    expect(subject.call(@env)).to eq DummyActionable
  end
end
