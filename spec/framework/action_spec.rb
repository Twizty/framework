require 'framework/action'

class DummyActionable
  include Framework::Action
end

RSpec.describe DummyActionable do
  subject{ described_class.new() }

  describe '#status' do
    it 'returns [status, {}, [body]]' do
      expect( subject.status(200, "test body") ).to eq [200, {}, ["test body"]]
    end
  end

  describe '#halt' do
    it 'throws :halt with [status, {}, [body]' do
      expect{
        subject.halt(404, "test")
      }.to throw_symbol(:halt, [404, {}, ["test"]])
    end
  end
end
