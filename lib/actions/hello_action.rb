module Actions

  class HelloAction
    include Framework::Action

    def call(params)
      status 200, "Hello, #{params['name']}"
    end
  end

end
