require 'github/oauth_client'

RSpec.describe Github::OauthClient do
  subject(:client) { Github::OauthClient.new }

  describe "#authorize_url" do
    subject { client.authorize_url }
    it { should eq("https://github.com/login/oauth/authorize") }
  end

  describe "#callback_url" do
    subject { client.callback_url }
    it { should eq "http://localhost:3000/oauth/callback" }
  end

end
