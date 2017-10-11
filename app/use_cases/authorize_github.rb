require 'github/app_config'
require 'github/authorizer'

class AuthorizeGithub
  attr_reader :config

  def initialize(callback_url:, config: ::Settings.github)
    @config = Github::AppConfig.build(client_id:     config.client_id,
                                      client_secret: config.client_secret,
                                      callback_url:  callback_url)
  end

  def call
    Github::Authorizer.new(config: config).authorize_url
  end
end
