# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
100.times do |index|
  u = User.create(name: Faker::Name.name,
                  lastname: Faker::Name.last_name,
                  email: "#{index}@junior.com",
                  tel: rand(998000000 .. 999999999),
                  password: "123456",
                  password_confirmation: "123456"
              )
  if ((index > 50) and (index < 90))
    u.build_store_owner(cpf: rand(88888888888 .. 99999999999)).save
  elsif index > 90
    u.build_dono_estacionamento(cpf: rand(22222222222 .. 88888888888)).save
  else
    n = u.build_normal_user(
      balance: index,
      cpf: rand(11111111111 .. 22222222222),
      placa: rand(000 .. 999))
    n.save
    n.cars.build(cor: "Prata", placa: rand(0000..9999), modelo: Faker::Name.name, marca: Faker::Name.last_name).save
  end
end

Estacionamento.destroy_all

e = Estacionamento.create(
            nome: "Campo de São Bento",
            endereco: Faker::Name.name,
            telefone: rand(998000000 .. 999999999),
            razao_social: Faker::Name.name,
            cnpj: rand(11111111 .. 99999999),
            latitude: "-22.9042",
            longitude: "-43.1074",
            primeira_hora: 5.0,
            hora: 6.0,
            mensal: 30.0,
            aberto: true,
            dono_estacionamentos_id: DonoEstacionamento.first.id
            )

10.times do |t|
  e.vacancies.build.save
end

e = Estacionamento.create(
            nome: "Plaza Shopping",
            endereco: Faker::Name.name,
            telefone: rand(998000000 .. 999999999),
            razao_social: Faker::Name.name,
            cnpj: rand(11111111 .. 99999999),
            latitude: "-22.8969",
            longitude: "-43.1239",
            primeira_hora: 5.0,
            hora: 6.0,
            mensal: 30.0,
            aberto: true,
            dono_estacionamentos_id: DonoEstacionamento.first.id + 2 
            )

10.times do |t|
  e.vacancies.build.save
end

e = Estacionamento.create(
            nome: "UFF",
            endereco: Faker::Name.name,
            telefone: rand(998000000 .. 999999999),
            razao_social: Faker::Name.name,
            cnpj: rand(11111111 .. 99999999),
            latitude: "-22.9045",
            longitude: "-43.1329",
            primeira_hora: 5.0,
            hora: 6.0,
            mensal: 30.0,
            aberto: true,
            dono_estacionamentos_id: DonoEstacionamento.first.id + 1
            )

10.times do |t|
  e.vacancies.build.save
end

50.times do |index|
  e = Estacionamento.create(nome: Faker::Name.name,
              endereco: Faker::Name.name,
              telefone: rand(998000000 .. 999999999),
              razao_social: Faker::Name.name,
              cnpj: rand(11111111 .. 99999999),
              latitude: rand(-22.99 .. -21.00),
              longitude: rand(-43.20 .. -43.10),
              primeira_hora: 5.0,
              hora: 6.0,
              mensal: 30.0,
              aberto: true,
              dono_estacionamentos_id: DonoEstacionamento.first.id


  )

  10.times do |t|
    e.vacancies.build.save
  end
  end

  3.times do |index|
    u = User.create(name: Faker::Name.name,
                    lastname: Faker::Name.last_name,
                    email: "#{(100+index)}@junior.com",
                    tel: rand(998000000 .. 999999999),
                    password: "123456",
                    password_confirmation: "123456"
                )
    u.build_operador_estacionamento(estacionamento_id: 1, cpf: rand(22222222222 .. 88888888888)).save
  end