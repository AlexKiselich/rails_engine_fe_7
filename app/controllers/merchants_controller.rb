class MerchantsController < ApplicationController
  def index
    @facade = MerchantsFacade.new(params)
  end

  def show
    @facade = MerchantsFacade.new(params)
  end
end