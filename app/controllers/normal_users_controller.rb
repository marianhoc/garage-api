class NormalUsersController < ApplicationController
  before_action :set_normal_user, only: [:show, :update, :destroy]

  # GET /normal_users
  def index
    @normal_users = NormalUser.all

    render json: @normal_users
  end

  # GET /normal_users/1
  def show
    render json: @normal_user
  end

  # POST /normal_users
  def create
    @normal_user = NormalUser.new(normal_user_params)

    if @normal_user.save
      render json: @normal_user, status: :created, location: @normal_user
    else
      render json: @normal_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /normal_users/1
  def update
    if @normal_user.update(normal_user_params)
      render json: @normal_user
    else
      render json: @normal_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /normal_users/1
  def destroy
    @normal_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_normal_user
      @normal_user = NormalUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def normal_user_params
      params.require(:normal_user).permit(:points, :user_id)
    end
end
