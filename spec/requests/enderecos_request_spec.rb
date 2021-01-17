require 'rails_helper'

RSpec.describe "Enderecos", type: :request do
  def authenticated_header
    payload = {
        sub: 1,
        name: "Latam Gateway",
        email: "dev@latamgateway.com",
        iat: 2516239022
    }
    secret = Rails.application.credentials.dig(:jwt, :secret_key)
    token = JWT.encode payload, secret, 'HS256'
    { 'Authorization': "Bearer #{token}" }
  end

  describe "POST /enderecos/search" do
    it 'espera retornar status 200 no método search' do
      post search_enderecos_path, params: { endereco: {cep: '60511005'} }, headers: authenticated_header
      expect(response).to have_http_status(200)
    end

    it 'espera retornar status 401 quando não passa o token' do
      post search_enderecos_path, params: { endereco: {cep: '60511005'} }
      expect(response).to have_http_status(401)
    end

    it 'espera retornar status 500 quando não passa o cep' do
      post search_enderecos_path, headers: authenticated_header
      expect(response).to have_http_status(500)
    end

    it 'espera retornar status 500 com uma mensagem quando cep é inválido ou não existe' do
      post search_enderecos_path, params: { endereco: {cep: '00000000'} }, headers: authenticated_header
      expect(response).to have_http_status(500)
      expect(response.body).to include_json({status:500, error:"Intercal Server Error", message: "Cep inválido ou não existe"})
    end

    it 'espera retornar status 500 com uma mensagem quando cep está fora do padrão' do
      post search_enderecos_path, params: { endereco: {cep: '00000'} }, headers: authenticated_header
      expect(response).to have_http_status(500)
      expect(response.body).to include_json({status:500, error:"Intercal Server Error", message: "Cep digitado fora do padrão"})
    end
  end
end


