class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id
  def initialize(data)
    @id = data[:id].to_i
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @unit_price = data[:attributes][:unit_price]
    @merchant_id = data[:attributes][:merchant_id].to_i
  end
end