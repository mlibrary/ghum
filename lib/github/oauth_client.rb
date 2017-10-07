module Github
  class OauthClient
    def authorize_url
      "https://github.com/login/oauth/authorize"
    end

    def callback_url
      "http://localhost:3000/oauth/callback" 
    end
  end
end

