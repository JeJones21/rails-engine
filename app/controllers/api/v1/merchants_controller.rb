class Api::V1::MerchantsController < ApplicationController

  def index
    if params[:page].to_i >= 1
      merchants = Merchant.paginate(page: params[:page])
    elsif params[:per_page]
      merchants = Merchant.paginate(page: 1, per_page: params[:per_page])
    else
      merchants = Merchant.paginate(page: 1)
    end
    render json: MerchantSerializer.new(merchants)
  end

  def show
     render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def find
    merchant = Merchant.where('name iLIKE ?', "%#{params['name']}%").order(:name).first

    if merchant == nil
      payload = { data:
        { status: 200
          }
        }
      render json: payload
    elsif params['name'] && Merchant.exists?(:id => merchant.id) && params['name'].empty? == false
      render json: MerchantSerializer.new(merchant)
    else
      render :status => :bad_request
    end
  end
end
