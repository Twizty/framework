require 'application'
require 'rack/test'

RSpec.describe Application do
  include Rack::Test::Methods

  def app
    Application.new
  end

  it 'returns valid response' do
    get '/hello?name=Peter'
    expect(last_response.body).to eq 'Hello, Peter'
  end
end
