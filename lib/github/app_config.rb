module Github
  AppConfig = Struct.new(:client_id, :client_secret, :callback_url) do
    def self.build(config = {})
      new(config[:client_id], config[:client_secret], config[:callback_url])
    end
  end
end

