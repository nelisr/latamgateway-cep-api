class InicioController < ApplicationController
  before_action :authorize_request, except: [:index]

  # GET /
  def index
    render json: { status: 200,  message: I18n.t("messages.errors.sem_autorizacao") }, status: 200
  end
end
