module Authenticable
  # Overwrite standard Devise current_user method
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_and_authorize!
    return render json: { errors: 'Not authenticated' }, status: 401 unless current_user
    return unless user_id = params[:user_id]
    render json: { errors: 'Not authorized' }, status: 422 if @current_user.id != user_id.to_i
  end

  def user_signed_in?
    current_user.present?
  end
end
