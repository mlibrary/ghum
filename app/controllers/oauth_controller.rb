class OauthController < ApplicationController
  def index
    render plain: Settings.github.client_id
  end

  def authorize
  end
end
