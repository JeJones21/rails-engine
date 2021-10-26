class Api::V1::MerchantsController < ApplicationController

  def index
    merchants = Merchant.paginate(page: 1)
    render json: MerchantSerializer.new(merchants)

  end

  def show
   merchant = Merchant.find(params[:id])
   json_response(MerchantSerializer.new(merchant))
 end
end
