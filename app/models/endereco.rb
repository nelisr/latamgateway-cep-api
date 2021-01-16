class Endereco < ApplicationRecord
  validates_presence_of :cep, :bairro,:cidade, :uf, :logradouro, :endereco_completo
  validates_uniqueness_of :cep
  validates_length_of :cep, minimum: 8, maximum: 8

  before_validation(on: [:create, :update]) do
    self.logradouro = "Sem Informação" if self.logradouro.blank?
    self.bairro = "Sem Informação" if self.bairro.blank?
    self.endereco_completo = "#{self.logradouro} - #{self.bairro} - #{self.cidade}/#{self.uf} - #{self.cep}"
    self.cep = self.cep.gsub(/\D+/, "").squeeze(" ").strip
  end
end
