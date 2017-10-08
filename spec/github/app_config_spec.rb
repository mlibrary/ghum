require 'github/app_config'

RSpec.describe Github::AppConfig do
  subject(:config) { Github::AppConfig.build(client_id: 'abcdef123', client_secret: '1234567890abcdef', callback_url: 'http://oauth.example.org/oauth/callback') }

  it 'has a client_id' do
    expect(config.client_id).to eq('abcdef123')
  end

  it 'has a client_secret' do
    expect(config.client_secret).to eq('1234567890abcdef')
  end

  it 'has a callback_url' do
    expect(config.callback_url).to eq('http://oauth.example.org/oauth/callback')
  end
end
