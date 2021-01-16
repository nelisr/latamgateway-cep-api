class EnderecosController < ApplicationController
  # POST /enderecos/search
  def search
    begin
      render json: Cep.search(cep_params[:cep])
    rescue Exception => e
      raise e
    end
  end

  private
  def cep_params
    params.require(:endereco).permit(:cep)
  end
end
