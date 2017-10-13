require 'ostruct'

module Github
  def self.oauth_config
    OpenStruct.new(client_id: nil, client_secret: nil)
  end
end
