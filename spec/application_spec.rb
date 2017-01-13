require 'application'
require 'rack/test'

RSpec.describe Application do
  include Rack::Test::Methods

  def app
    Application.new
  end

  describe 'routing' do
    it 'routes GET /hello to HelloAction' do
      expect_any_instance_of(Actions::HelloAction).to receive(:call).and_call_original
      get "/hello"
    end

    it 'distinguishes get and post' do
      expect_any_instance_of(Actions::HelloAction).not_to receive(:call)
      post "/hello"
    end

    it 'responds with 404 if path was not found' do
      post "/unknown"
      expect( last_response.status ).to eq 404
    end
  end


  describe 'GET /hello' do
    it 'returns valid response' do
      get '/hello?name=Peter'
      expect(last_response.body).to eq 'Hello, Peter'
    end
  end

  describe 'GET /halt' do
    it 'returns valid response' do
      get '/halt'
      expect(last_response.status).to eq 500
    end
  end
end
