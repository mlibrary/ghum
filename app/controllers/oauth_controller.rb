class OauthController < ApplicationController
  def index
    render plain: Settings.github.client_id
  end

  def authorize
    redirect_to AuthorizeGithub.new(callback_url: oauth_callback_url).call
  end
end
