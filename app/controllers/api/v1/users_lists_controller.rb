class Api::V1::Users::Lists < Api::V1::BaseController
  before_action :authenticate_and_authorize!, only: [:create, :update]
  respond_to :json

  def index
    respond_with List.all
  end

  def show
    respond_with List.find(params[:id])
  end

  def create
    list = current_user.lists.build(list_params)
    if list.save
      render json: list, status: 201, location: [:api, list]
    else
      render json: { errors: list.errors }, status: 422
    end
  end

  def update
    list = current_user.lists.find(params[:id])
    if list.update(list_params)
      render json: list, status: 200, location: [:api, list]
    else
      render json: { errors: list.errors }, status: 422
    end
  end

  def destroy
    list = current_user.lists.find(params[:id])
    list.destroy
    head 204
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
