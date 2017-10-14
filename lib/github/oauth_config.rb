unless defined?(Github) && Github.respond_to?(:oauth_config)
  require 'ostruct'

  module Github
    def self.oauth_config
      OpenStruct.new(client_id: '<CLIENT ID>', client_secret: '<CLIENT SECRET>')
    end
  end
end
