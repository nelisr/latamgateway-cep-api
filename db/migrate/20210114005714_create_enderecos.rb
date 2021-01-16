class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :endereco_completo
      t.string :cep

      t.timestamps
    end
  end
end
