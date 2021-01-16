FactoryBot.define do
  factory :endereco do
    logradouro { Faker::Address.street_name }
    bairro { Faker::Address.community }
    cidade { Faker::Address.city }
    uf { Faker::Address.state }
    endereco_completo { "MyString" }
    cep { Faker::Address.zip_code }
  end
end
