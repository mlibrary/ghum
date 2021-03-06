require 'github/authorizer'

class OauthController < ApplicationController
  def index
    render plain: Settings.github.client_id
  end

  def authorize
    redirect_to authorizer.authorize_url
  end

  def callback
    access_token = ExchangeCode.new(
      authorizer: authorizer,
      callback_url: oauth_callback_url,
      code: auth_code
    ).call
    render plain: "Got access token: #{access_token}"
  end

  private

    def authorizer
      Github::Authorizer.new(callback_url: oauth_callback_url)
    end

    def auth_code
      params.require(:code)
    end
end
