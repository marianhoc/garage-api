class ApplicationController < ActionController::API
  def is_admin
    user = User.find_by(authentication_token: params[:token])
    if !user.admin
      render json: { erro: "usuario não é administrador" }, status: :unauthorized
      return
    end
  end
end
