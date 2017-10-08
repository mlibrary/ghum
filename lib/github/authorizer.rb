require 'uri'
require 'net/http'

module Github
  class Authorizer
    attr_accessor :config, :client

    def initialize(config: AppConfig.new, client: Net::HTTP)
      @config = config
      @client = client
    end

    def authorize_url
      "#{base_authorize_url}?#{authorize_query}"
    end

    def access_token(code)
      raw_token = exchange_auth_code(code)
      Hash[URI.decode_www_form(raw_token)]['access_token']
    end

    def base_authorize_url
      "https://github.com/login/oauth/authorize"
    end

    def base_access_token_url
      'https://github.com/login/oauth/access_token'
    end

    private

      def exchange_auth_code(code)
        uri = URI(base_access_token_url)
        res = client.post_form(uri, client_id: config.client_id,
                               client_secret: config.client_secret, code: code)
        res.body
      end

      def authorize_query
        URI.encode_www_form(client_id: config.client_id, redirect_uri: config.callback_url)
      end
  end
end

