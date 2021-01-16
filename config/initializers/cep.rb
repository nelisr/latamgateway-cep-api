require 'net/http'

module Cep
  class << self
    def search(cep)
      begin
        cep = cep.gsub(/\D+/, "").squeeze(" ").strip
        if cep.size.eql?(8)
          uri = URI.parse("http://cep.la")
          http = Net::HTTP.new(uri.host, uri.port)

          request = Net::HTTP::Get.new("#{uri.request_uri}/#{cep}")
          request["Content-Type"] = "application/json"
          request["Accept"] = "application/json"

          response = JSON.parse(http.request(request).body)

          validate(response)
        else
          raise I18n.t 'messages.errors.cep_sem_padrao'
        end
      rescue Exception => e
        raise e
      end
    end

    private
    def validate(response)
      unless response.blank?
        @endereco = Endereco.find_by(cep: response["cep"])
        unless @endereco.blank? || @endereco.nil?
          @endereco.update_attributes!(response)
          @endereco
        else
          Endereco.create(response)
        end
      else
        raise I18n.t "messages.errors.cep_nao_encontrado"
      end
    end
  end
end
