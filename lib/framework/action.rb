module Framework

  module Action
    def status(status, body)
      [status, {}, [body]]
    end

    def halt(status, body)
      throw :halt, status(status, body)
    end
  end

end