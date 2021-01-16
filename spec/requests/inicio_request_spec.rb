require 'rails_helper'

RSpec.describe "InicioController - Requests", type: :request do
  describe "GET /" do
    it 'espera retornar status 200 no método index' do
      get root_path
      expect(response).to have_http_status(200)
    end

    it 'espera retornar no body um objeto json com o atributo mensagem com uma frase' do
      get root_path
      expect(response.body).to include_json(message: 'Bem Vindo a API REST de consulta de CEP')
      expect(response.body).to include_json(message: (be_a_kind_of String))
    end
  end
end
