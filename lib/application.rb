require_relative './framework'
require_relative './actions'
require 'pry'

class Application
  def call(env)
    params = get_params(env)

    routes = {
      ['GET', '/hello'] => Actions::HelloAction,
      ['GET', '/halt']  => Actions::HaltAction
    }
    routes.default = Actions::NotFoundAction

    action = routes[ [env['REQUEST_METHOD'], env['PATH_INFO']] ]

    catch(:halt){ action.new.call(params) }
  end

  private

  def get_params(env)
    Rack::Request.new(env).params
  end
end
