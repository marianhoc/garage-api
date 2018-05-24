class UserRegistrationController < Devise::RegistrationsController

  # POST /users
  def create
    puts "======================== POST USER ==============================="
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end



  # Only allow a trusted parameter "white list" through.
  def user_params
    puts "================== entrando no user_params =====================  ==="
    params.require(:user)
        .permit(:name,
                :sobrenome,
                :cpf,
                :email,
                :birth,
                :tel,
                :password,
                :password_confirmation,
                :token)
  end
end
