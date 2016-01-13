class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from JSON::ParserError, with: :invalid_json

  include Authenticable
  # Using :null_session to prevent CSRF attacks
  protect_from_forgery with: :null_session

  before_action :destroy_session

  protected

  def destroy_session
    request.session_options[:skip] = true
  end

  def json
    return @json if @json
    body = request.body.read
    @json = ActiveSupport::JSON.decode(body)
  end

  def invalid_json
    render json: { errors: 'Invalid or empty JSON structure' }, status: 422
  end

  def not_found
    head 404
  end
end
