class EnderecosController < ApplicationController
  # POST /enderecos/search
  def search
    begin
      render json: Cep.search(cep_params[:cep])
    rescue Exception => e
      render json: { status: 500, error: 'Intercal Server Error', message: e.message }, status: :internal_server_error
    end
  end

  private
  def cep_params
    params.require(:endereco).permit(:cep)
  end
end
