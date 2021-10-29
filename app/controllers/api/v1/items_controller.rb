class Api::V1::ItemsController < ApplicationController
  def index
    per_page = params.fetch(:per_page, 20).to_i
    page = params.fetch(:page, 1).to_i
    page = 1 if page < 1
    render json: ItemSerializer.new(Item.offset((page - 1) * per_page).limit(per_page))
  end
  # if params[:page].to_i >= 1
  #     items = Item.paginate(page: params[:page])
  #   elsif params[:per_page]
  #     items = Item.paginate(page: 1, per_page: params[:per_page])
  #   else
  #     items = Item.paginate(page: 1)
  #   end
  #   render json: ItemSerializer.new(items)
  def show
    item = Item.find(params[:id])
    render json: ItemSerializer.new(item)
  end

  def create
    item = Item.create(item_params)
    render json: ItemSerializer.new(item), status: 201
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    render json: ItemSerializer.new(item)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  # def find_all_items
  #   items = Item.where('name iLIKE ?', "%#{params['name']}%")
  #
  #   if params['name'] && params['name'].empty? == false
  #     render json: ItemSerializer.new(items)
  #   else
  #     render json: {data:{}}, :status => :bad_request
  #   end
  # end
 # refactor, not working
  private

  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end
