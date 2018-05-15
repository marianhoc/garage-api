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
              cpf: rand(11111 .. 99999),
              email: "#{index}@junior.com",
              tel: rand(11111 .. 99999),
              password: "123456",
              password_confirmation: "123456"
              )
  if index > 50
    u.build_partner.save
  end
end

Estacionamento.destroy_all
100.times do |index|
  Estacionamento.create(nome: Faker::Name.name,
              endereco: Faker::Name.name,
              telefone: rand(11111111 .. 99999999),
              razao_social: Faker::Name.name,
              cnpj: rand(11111111 .. 99999999)
              )
  end
