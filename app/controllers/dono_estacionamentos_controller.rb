class DonoEstacionamentosController < ApplicationController
  before_action :set_dono_estacionamento, only: [:show, :update, :destroy]

  # GET /dono_estacionamentos
  def index
    @dono_estacionamentos = DonoEstacionamento.all

    render json: @dono_estacionamentos
  end

  # GET /dono_estacionamentos/1
  def show
    render json: @dono_estacionamento
  end

  # POST /dono_estacionamentos
  def create
    @dono_estacionamento = DonoEstacionamento.new(dono_estacionamento_params)

    if @dono_estacionamento.save
      render json: @dono_estacionamento, status: :created, location: @dono_estacionamento
    else
      render json: @dono_estacionamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dono_estacionamentos/1
  def update
    if @dono_estacionamento.update(dono_estacionamento_params)
      render json: @dono_estacionamento
    else
      render json: @dono_estacionamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dono_estacionamentos/1
  def destroy
    @dono_estacionamento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dono_estacionamento
      @dono_estacionamento = DonoEstacionamento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dono_estacionamento_params
      params.require(:dono_estacionamento).permit(:user_id, :cpf)
    end
end
