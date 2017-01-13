module Actions

  class NotFoundAction
    include Framework::Action

    def call(_)
      status 404, "Not found"
    end
  end

end