require_relative '../../app/use_cases/exchange_code'
require 'uri'

RSpec.describe ExchangeCode do
  let(:authorizer) { instance_double('Github::Authorizer') }
  subject(:exchange) { ExchangeCode.new(authorizer: authorizer, callback_url: '/blargh', code: 'auth_code123') }

  it 'works' do
    expect(authorizer).to receive(:access_token).with('auth_code123')
    exchange.call
  end

end

