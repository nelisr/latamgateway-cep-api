class InicioController < ApplicationController
  before_action :authorize_request, except: [:index]

  # GET /
  def index
    render json: { message: "Bem Vindo a API REST de consulta de CEP" }, status: 200
  end
end
