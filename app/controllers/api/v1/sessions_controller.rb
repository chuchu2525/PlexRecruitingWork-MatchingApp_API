class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email], role: params[:role])
    if user&.authenticate(params[:password])
      if user.role == 'student' && user.student_profile.nil?
        render json: { user: user, token: generate_token(user), redirect_to: 'student_profile' }, status: :ok
      elsif user.role == 'company' && user.company_profile.nil?
        render json: { user: user, token: generate_token(user), redirect_to: 'company_profile' }, status: :ok
      else
        render json: { user: user, token: generate_token(user), redirect_to: 'index' }, status: :ok
      end
    else
      render json: { error: 'Invalid email, password, or role' }, status: :unauthorized
    end
  end

  private

  def generate_token(user)
    # JWTトークンを生成するロジックをここに追加
  end
end