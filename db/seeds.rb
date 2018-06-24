# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Estacionamento.destroy_all
Loja.destroy_all

#Criando admin
1.times do |i|
  u = User.create(
    name: "Anderson",
    lastname: "Rocha",
    email: "admin@email.com",
    tel: rand(998000000 .. 999999999),
    password: "123456",
    password_confirmation: "123456"
  )
  u.build_admin().save
end

#Criando usuários normais
100.times do |i|
  u = User.create(
    name: Faker::Name.name,
    lastname: Faker::Name.last_name,
    email: "usuario#{i}@email.com",
    tel: rand(998000000 .. 999999999),
    password: "123456",
    password_confirmation: "123456"
  )

  n = u.build_normal_user(balance: 50, cpf: rand(11111111111 .. 22222222222))
  n.save
  n.cars.build(
    cor: Faker::Color.color_name, 
    placa: "INJ-"+rand(0000..9999).to_s, 
    modelo: "Clio", 
    marca: "Renault",
  ).save
end

#Criando Donos e respectivos estacionamentos
55.times do |index|
  u = User.create(name: Faker::Name.name,
                  lastname: Faker::Name.last_name,
                  email: "donoest#{index}@email.com",
                  tel: rand(998000000 .. 999999999),
                  password: "123456",
                  password_confirmation: "123456")

  u.build_dono_estacionamento(cpf: rand(22222222222 .. 88888888888)).save

  e = Estacionamento.create(
              nome: Faker::Address.community,
              endereco: Faker::Address.street_address,
              bairro: Faker::Address.community,
              cidade: Faker::Address.country,
              estado: Faker::Address.state_abbr,
              telefone: rand(998000000 .. 999999999),
              razao_social: Faker::Name.name,
              cnpj: rand(11111111 .. 99999999),
              latitude: rand(-22.99 .. -21.00),
              longitude: rand(-43.20 .. -43.10),
              primeira_hora: rand(5.00 .. 10.00),
              hora: rand(6.00 .. 11.00),
              mensal: rand(30.00 .. 60.00),
              taxa_reserva: rand(10.00 .. 20.00),
              aberto: true,
              dono_estacionamentos_id: u.dono_estacionamento.id,
              total_vagas: 10,
              agencia: rand(111 .. 999),
              conta: rand(11111 .. 99999) 
  )

  e.total_vagas.times do |t|
    e.vacancies.build.save
  end
end

#Criando 1 operador pra cada estacionamento
50.times do |index|
  u = User.create(name: Faker::Name.name,
                  lastname: Faker::Name.last_name,
                  email: "operadorest#{index}@email.com",
                  tel: rand(998000000 .. 999999999),
                  password: "123456",
                  password_confirmation: "123456"
              )
  u.build_operador_estacionamento(estacionamento_id: index, cpf: rand(22222222222 .. 88888888888)).save
end

#Criando dono sem estacionamentos
10.times do |index|
  u = User.create(name: Faker::Name.name,
                  lastname: Faker::Name.last_name,
                  email: "donoest#{50+index}@email.com",
                  tel: rand(998000000 .. 999999999),
                  password: "123456",
                  password_confirmation: "123456"
              )
              
  u.build_dono_estacionamento(cpf: rand(22222222222 .. 88888888888)).save
end

#Criando donos e suas respectivas lojas
50.times do |index|
  u = User.create(name: Faker::Name.name,
                  lastname: Faker::Name.last_name,
                  email: "donoloja#{index}@email.com",
                  tel: rand(998000000 .. 999999999),
                  password: "123456",
                  password_confirmation: "123456"
              )

  u.build_store_owner(cpf: rand(88888888888 .. 99999999999)).save

  Loja.create(
            nome: Faker::Address.community,
            endereco: Faker::Address.street_address,
            latitude: rand(-22.99 .. -21.00),
            longitude: rand(-43.31 .. -43.11),
            cnpj: rand(11111111 .. 99999999),
            store_owner_id: StoreOwner.last.id
    )
end

#Criando 1 operador pra cada loja
50.times do |index|
  u = User.create(name: Faker::Name.name,
                  lastname: Faker::Name.last_name,
                  email: "operadorloja#{index}@email.com",
                  tel: rand(998000000 .. 999999999),
                  password: "123456",
                  password_confirmation: "123456"
              )
  u.build_operador_loja(cpf: rand(22222222222 .. 88888888888), loja_id: index).save
end

#Criando estacionamentos especificos 
e = Estacionamento.create(
            nome: "Campo de São Bento",
            endereco: Faker::Address.street_address,
            bairro: Faker::Address.community,
            cidade: Faker::Address.country,
            estado: Faker::Address.state_abbr,
            telefone: rand(998000000 .. 999999999),
            razao_social: Faker::Name.name,
            cnpj: rand(11111111 .. 99999999),
            latitude: "-22.9042",
            longitude: "-43.1074",
            primeira_hora: rand(5.00 .. 10.00),
            hora: rand(6.00 .. 11.00),
            mensal: rand(30.00 .. 60.00),
            taxa_reserva: rand(10.00 .. 20.00),
            aberto: true,
            dono_estacionamentos_id: DonoEstacionamento.first.id,
            total_vagas: 10,
            agencia: rand(111 .. 999),
            conta: rand(11111 .. 99999)
            )

e.total_vagas.times do |t|
  e.vacancies.build.save
end

e = Estacionamento.create(
            nome: "Plaza Shopping",
            endereco: Faker::Address.street_address,
            bairro: Faker::Address.community,
            cidade: Faker::Address.country,
            estado: Faker::Address.state_abbr,
            telefone: rand(998000000 .. 999999999),
            razao_social: Faker::Name.name,
            cnpj: rand(11111111 .. 99999999),
            latitude: "-22.8969",
            longitude: "-43.1239",
            primeira_hora: rand(5.00 .. 10.00),
            hora: rand(6.00 .. 11.00),
            mensal: rand(30.00 .. 60.00),
            taxa_reserva: rand(10.00 .. 20.00),
            aberto: true,
            dono_estacionamentos_id: DonoEstacionamento.first.id + 2,
            total_vagas: 10,
            agencia: rand(111 .. 999),
            conta: rand(11111 .. 99999)
            )

e.total_vagas.times do |t|
  e.vacancies.build.save
end

e = Estacionamento.create(
            nome: "UFF",
            endereco: Faker::Address.street_address,
            bairro: Faker::Address.community,
            cidade: Faker::Address.country,
            estado: Faker::Address.state_abbr,
            telefone: rand(998000000 .. 999999999),
            razao_social: Faker::Name.name,
            cnpj: rand(11111111 .. 99999999),
            latitude: "-22.9045",
            longitude: "-43.1329",
            primeira_hora: rand(5.00 .. 10.00),
            hora: rand(6.00 .. 11.00),
            mensal: rand(30.00 .. 60.00),
            taxa_reserva: rand(10.00 .. 20.00),
            aberto: true,
            dono_estacionamentos_id: DonoEstacionamento.first.id + 1,
            total_vagas: 10,
            agencia: rand(111 .. 999),
            conta: rand(11111 .. 99999)
            )

e.total_vagas.times do |t|
  e.vacancies.build.save
end

#Favoritando estacionamentos
50.times do |index|
  EstacionamentosFavorito.create(
    normal_user_id:  index,
    estacionamento_id: index,
              )
end