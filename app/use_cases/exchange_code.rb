class ExchangeCode
  def initialize(authorizer:, callback_url:, code:)
    @authorizer = authorizer
    @callback_url = callback_url
    @code = code
  end

  def call
    access_code = authorizer.access_token(code)
  end

  private
  attr_reader :authorizer, :callback_url, :code
end

