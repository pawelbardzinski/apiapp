class Api::V1::SessionsController < Api::V1::BaseController
  before_action :authenticate_and_authorize!, only: [:destroy]

  def create
    user = find_user
    return unathorized_access unless user
    if user.valid_password? @user_password
      user.generate_authentication_token!
      user.save
      render json: user, status: 200
    else
      unathorized_access
    end
  end

  def destroy
    current_user.generate_authentication_token!
    current_user.save
    head 204
  end

  private

  def unathorized_access
    render json: { errors: 'Invalid email or password' }, status: 401
  end

  def find_user
    @user_password = json['password']
    user_email = json['email']
    user_email.present? && User.find_by(email: user_email)
  end
end
