require 'github/authorizer'

RSpec.describe Github::Authorizer do
  subject(:authorizer) { Github::Authorizer.new('cooldude42') }

  it "is bound to the supplied username" do
    expect(authorizer.username).to eq('cooldude42')
  end
end

