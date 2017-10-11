require_relative '../../app/use_cases/authorize_github'
require 'uri'

RSpec.describe AuthorizeGithub do
  let(:cfg) { double('OAuth Config', client_id: 'foo', client_secret: 'bar') }
  subject(:auth) { AuthorizeGithub.new(callback_url: '/oauth/callback', config: cfg) }

  it 'gives a valid URL' do
    expect {
      URI.parse(auth.call)
    }.not_to raise_error
  end
end
