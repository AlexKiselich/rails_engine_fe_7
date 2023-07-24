class MerchantsFacade
  attr_reader :merchant_id
  def initialize(params)
    @merchant_id = params[:id].to_i
  end

  def service
    MerchantsService.new
  end

  def merchant
    json = service.merchant(@merchant_id)
    Merchant.new(json[:data])
  end

  def merchant_items
    json = service.merchant_items(@merchant_id)
    json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def merchants
    json = service.merchants
    json[:data].map do |merchant_data|
      Merchant.new(merchant_data)
    end
  end
end