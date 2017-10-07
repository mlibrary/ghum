module Github
  class Authorizer
    attr_accessor :username

    def initialize(username)
      @username = username
    end
  end
end

