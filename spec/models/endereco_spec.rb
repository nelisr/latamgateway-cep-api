require 'rails_helper'

RSpec.describe Endereco, type: :model do
  context "Criar um novo endereço" do
    it { expect(create(:endereco)).to be_valid }
    it { expect{create(:endereco)}.to change{Endereco.all.size}.by(1) }
  end

  context "Validações" do
      # it { is_expected.to validate_presence_of(:logradouro) }
      # it { is_expected.to validate_presence_of(:bairro) }
      it { is_expected.to validate_presence_of(:cidade) }
      it { is_expected.to validate_presence_of(:uf) }
      #it { is_expected.to validate_presence_of(:endereco_completo) }
      it { is_expected.to validate_presence_of(:cep) }
      it { is_expected.to validate_uniqueness_of(:cep) }
      it { is_expected.to validate_length_of(:cep).is_at_least(8).is_at_most(8) }
  end
end
