class Endereco < ApplicationRecord
  validates :cep, :bairro,:cidade, :uf, :logradouro, :endereco_completo , presence: true
  validates :cep, uniqueness: true
  before_validation(on: [:create, :update]) do
    self.logradouro = "Sem Informação" if self.logradouro.blank?
    self.bairro = "Sem Informação" if self.bairro.blank?
    self.endereco_completo = "#{self.logradouro} - #{self.bairro} - #{self.cidade}/#{self.uf} - #{self.cep}"
  end
end
