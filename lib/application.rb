require_relative './framework'
require_relative './actions'
require 'pry'

class Application
  def call(env)
    params = get_params(env)

    router = Framework::Router.new
    router.instance_eval do
      get '/hello', to: Actions::HelloAction
      get '/halt', to: Actions::HaltAction
      get '*', to: Actions::NotFoundAction
    end

    action = router.call env

    catch(:halt){ action.new.call(params) }
  end

  private

  def get_params(env)
    Rack::Request.new(env).params
  end
end
