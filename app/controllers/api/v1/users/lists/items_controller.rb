class Api::V1::Users::Lists::ItemsController < Api::V1::BaseController
  before_action :authenticate_and_authorize!, only: [:create, :update, :destroy]
  before_action :set_list, except: [:index]
  before_action :set_item, except: [:create, :index]
  respond_to :json

  def index
    @list = List.includes(:items).find_by!(user_id: params[:user_id], id: params[:list_id])
    respond_with @list.items
  end

  def show
    respond_with @item
  end

  def create
    @item = @list.items.build(item_params)
    if @item.save
      render json: @item, status: 201
    else
      render json: { errors: @item.errors }, status: 422
    end
  end

  def update
    if @item.update(item_params)
      render json: @item, status: 200
    else
      render json: { errors: @item.errors }, status: 422
    end
  end

  def destroy
    @item.destroy
    head 204
  end

  private

  def item_params
    json.slice('title', 'state')
  end

  def set_list
    @list = List.find_by!(user_id: params[:user_id], id: params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end
end
