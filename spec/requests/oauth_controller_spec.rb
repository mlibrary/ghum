require 'rails_helper'

RSpec.describe 'OAuth Integration', type: :request do
  it 'redirects to GitHub' do
    get oauth_authorize_path
    expect(response).to be_a_redirect
  end
end
