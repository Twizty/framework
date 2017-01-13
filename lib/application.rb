class Application
  def call(env)
    case env[:PATH_INFO]
    when '/hello'
      HelloAction.new.call(params)
    end
  end
end
