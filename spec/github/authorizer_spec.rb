require 'github/authorizer'

RSpec.describe Github::Authorizer do
  let(:config) {
    double('OAuth Config',
           client_id: 'abcdef123',
           client_secret: '1234567890abcdef',
           callback_url: 'http://oauth.example.org/fake/callback')
  }

  let(:response) { double('response', body: 'access_token=access_token123&token_type=bearer') }

  subject(:authorizer) { Github::Authorizer.new(config: config) }

  it 'generates the authorization URL based on config' do
    expect(authorizer.authorize_url).to eq(
      'https://github.com/login/oauth/authorize?client_id=abcdef123&redirect_uri=http%3A%2F%2Foauth.example.org%2Ffake%2Fcallback')
  end

  it 'exchanges an authorization code for an access token' do
    client = double('HTTP Client', post_form: response)
    expect(client).to receive(:post_form)

    authorizer = Github::Authorizer.new(config: config, client: client)
    token = authorizer.access_token(code: 'auth_code123')
    expect(token).to eq('access_token123')
  end

end

