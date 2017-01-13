module Actions

  class HaltAction
    include Framework::Action

    def call(params)
      halt 500, "Oops"
    end
  end

end
