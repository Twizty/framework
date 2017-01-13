class Application
  def call(_env)
    [200, { 'Content-Type' => 'text/plain' }, ['ab']]
  end
end
