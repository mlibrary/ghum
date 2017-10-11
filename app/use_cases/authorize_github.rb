class AuthorizeGithub
  attr_reader :config

  def initialize
    config = ::Settings.github
    routes = Rails.application.routes.url_helpers 
    @config = Github::AppConfig.build(client_id: config.client_id, client_secret: config.client_secret, callback_url: routes.oauth_callback_url)
  end

  def authorize_url
    Github::Authorizer.new(config: config).authorize_url
  end
end
