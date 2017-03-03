module Framework
  class Router

    def initialize
      @routes = {}
      @routes.default = Actions::NotFoundAction
    end

    def get(route, to:)
      @routes[['GET', route ]] = to
      nil
    end

    def call(env)
      @routes[ [env['REQUEST_METHOD'], env['PATH_INFO']] ]
    end

    attr_accessor :routes
  end
end
