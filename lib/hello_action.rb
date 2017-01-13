class HelloAction
  include Action

  def call(params)
    status 200, "Hello, #{params[:name]}"
  end
end
