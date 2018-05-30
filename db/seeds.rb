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
                  tel: rand(11111 .. 99999),
                  password: "123456",
                  password_confirmation: "123456"
              )
  if index > 50
    u.build_store_owner(cpf: rand(11111 .. 99999)).save
  else
    u.build_normal_user(
      balance: index,
      cpf: rand(11111 .. 99999),
      placa: rand(11111 .. 99999)).save
  end
end

Estacionamento.destroy_all

Estacionamento.create(
            nome: "Campo de São Bento",
            endereco: Faker::Name.name,
            telefone: rand(11111111 .. 99999999),
            razao_social: Faker::Name.name,
            cnpj: rand(11111111 .. 99999999),
            latitude: "-22.9042,",
            longitude: "-43.1074"
            )

Estacionamento.create(
            nome: "Plaza Shopping",
            endereco: Faker::Name.name,
            telefone: rand(11111111 .. 99999999),
            razao_social: Faker::Name.name,
            cnpj: rand(11111111 .. 99999999),
            latitude: "-22.8969",
            longitude: "-43.1239"
            )


100.times do |index|
  Estacionamento.create(nome: Faker::Name.name,
              endereco: Faker::Name.name,
              telefone: rand(11111111 .. 99999999),
              razao_social: Faker::Name.name,
              cnpj: rand(11111111 .. 99999999),
              latitude: rand(1111 .. 99999),
              longitude: rand(1111 .. 99999)
              )
  end
