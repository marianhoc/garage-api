class EstacionamentosController < ApplicationController
  before_action :set_estacionamento, only: [:show, :update, :destroy]
  before_action :is_admin, only: [:set_total_vagas]

  def set_total_vagas
    @estacionamento = Estacionamento.find_by(id: params[:estacionamento][:id])
    if params[:operation] == "aumenta"
      @estacionamento.aumenta_total_vagas()
      render json: @estacionamento
    elsif @estacionamento.diminui_total_vagas()
      render json: @estacionamento
    else
      render json: @estacionamento.errors, status: :unprocessable_entity
    end
  end

  def index_operador
    @estacionamentos = Estacionamento.where(
      id: OperadorEstacionamento.find(params[:operador_estacionamento_id]).id)

    render json: @estacionamentos
  end

  # GET /estacionamentos
  def index
    @estacionamentos = Estacionamento.all

    render json: @estacionamentos
  end

  # GET /estacionamentos/1
  def show
    render json: @estacionamento
  end

  # POST /estacionamentos
  def create
    dono = User.find_by(email: params[:estacionamento][:dono_estacionamento])

    if !dono.nil? && dono.dono_estacionamento
      #render json: { sucesso: "Dono de estacionamento encontrado", dono: dono }
      @estacionamento = dono.dono_estacionamento.estacionamentos.build(estacionamento_params)

      if @estacionamento.save
        render json: @estacionamento, status: :created, location: @estacionamento
      else
        render json: @estacionamento.errors, status: :unprocessable_entity
      end
    else
      render json: { error: "Dono de estacionamento não encontrado" }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estacionamentos/1
  def update
    if @estacionamento.update(estacionamento_params)
      render json: @estacionamento
    else
      render json: @estacionamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estacionamentos/1
  def destroy
    @estacionamento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estacionamento
      @estacionamento = Estacionamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estacionamento_params
      params.require(:estacionamento).permit(:nome, :endereco, :telefone, :razao_social, :cnpj, :aberto, 
        :bairro, :cidade, :estado, :agencia, :conta, :total_vagas)
    end
end
