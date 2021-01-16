require 'jwt'

module Auth
  class << self
    def verify(token)
      user = decode(token).at(0)
      unless user['name'].eql?("Latam Gateway") && user['email'].eql?("dev@latamgateway.com") # simula a validação de existencia de usuário no banco
        raise I18n.t 'messages.errors.sem_autorizacao'
      end
    end

    private
    def decode(token)
      begin
        JWT.decode token, Rails.application.credentials.dig(:jwt, :secret_key), true,{ algorithm: 'HS256' }
      rescue JWT::DecodeError => e
        raise e
      end
    end
  end
end