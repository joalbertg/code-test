# frozen_string_literal: true

class Product
  attr_accessor :name, :sell_in, :price

  def initialize(name, sell_in, price)
    @name = name
    @sell_in = sell_in
    @price = price
  end
end
