class EstacionamentoSerializer < ActiveModel::Serializer
  attributes :id, :nome, :endereco, :telefone, :razao_social,
    :cnpj, :latitude, :longitude, :primeira_hora, :mensal, :hora,
    :created_at, :updated_at

  belongs_to :dono_estacionamentos, class_name: "DonoEstacionamento"

  has_many :vacancies
  has_many :reservations
end
