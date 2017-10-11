require 'rails_helper'
require 'uri'

RSpec.describe AuthorizeGithub do
  subject(:auth) { AuthorizeGithub.new }

  describe '#authorize_url' do
    it 'gives a valid URL' do
      expect {
        URI.parse(auth.authorize_url)
      }.not_to raise_error
    end
  end
end
