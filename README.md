### Latam Gateway Cep API
Esse é uma projeto que possui serviços REST para consulta de CEP.

### Requisitos
- Ruby 2.7.2
- Rails 5.2.4

### Como usar 
1. Baixar o projeto em seu ambiente de trabalho.
2. Entrar na pasta do projeto.
3. Instalar as dependências do projeto.
```
bundle ou bundle install
```
4. Adicionar as credenciais do banco de dados no arquivo config/database.yml.
```
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: HOST_DO_BANCO
  port: 5432
  username: USER_DO_BANCO
  password: PASSWORD_DO_BANCO

development:
  <<: *default
  database: NAME_DO_BANCO_dev

test:
  <<: *default
  database: NAME_DO_BANCO_test

production:
  <<: *default
  database: NAME_DO_BANCO
```
5. Após adicionar as credenciais de acesso ao banco de dados  rodar esse comando abaixo para criar o banco de dados e criar as tabelas do projeto
```
rails db:create db:migrate RAILS_ENV=production
```
6. Agora iremos 'startar' o projeto com o comando abaixo
```
rails server -b 0.0.0.0 -p 3000 -e production
```
7. Com o projeto 'startada' utiliza o serviço REST para consultas CEPs
```
Endpoint: http://localhost:3000/enderecos/search
Method: POST
Body: {"cep": "60511005"}
Token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwibmFtZSI6IkxhdGFtIEdhdGV3YXkiLCJlbWFpbCI6ImRldkBsYXRhbWdhdGV3YXkuY29tIiwiaWF0IjoyNTE2MjM5MDIyfQ.NdqVoKGFFRnjEs5kwbtjVk2KGWMGzX_H4d9YBbqs_1g
Response: 
{
    "id": 1,
    "cep": "60511005",
    "uf": "CE",
    "cidade": "Fortaleza",
    "bairro": "Pici",
    "logradouro": "Rua Tibúrcio Albano",
    "endereco_completo": "Rua Tibúrcio Albano - Pici - Fortaleza/CE - 60511005",
    "created_at": "2021-01-15T11:11:28.650-03:00",
    "updated_at": "2021-01-15T11:11:28.650-03:00"
}
```
8. Caso queira acessar a aplicação em produção (Heroku): 
```
Endpoint: https://latamgateway-cep-api.herokuapp.com/enderecos/search
Method: POST
Body: {"cep": "60511005"}
Token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwibmFtZSI6IkxhdGFtIEdhdGV3YXkiLCJlbWFpbCI6ImRldkBsYXRhbWdhdGV3YXkuY29tIiwiaWF0IjoyNTE2MjM5MDIyfQ.NdqVoKGFFRnjEs5kwbtjVk2KGWMGzX_H4d9YBbqs_1g
Response: 
{
    "id": 1,
    "cep": "60511005",
    "uf": "CE",
    "cidade": "Fortaleza",
    "bairro": "Pici",
    "logradouro": "Rua Tibúrcio Albano",
    "endereco_completo": "Rua Tibúrcio Albano - Pici - Fortaleza/CE - 60511005",
    "created_at": "2021-01-15T11:11:28.650-03:00",
    "updated_at": "2021-01-15T11:11:28.650-03:00"
}
``` 
### Versão 
- 1.0.0
