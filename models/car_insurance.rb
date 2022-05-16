# frozen_string_literal: true

class CarInsurance
  def initialize(products)
    @products = products
  end

  def update_price
    products.each do |product|
      if product.name != FULL_COVERAGE && product.name != SPECIAL_FULL_COVERAGE
        product.price -= 1 if product.price.positive? && product.name != 'Mega Coverage'
      elsif product.price < 50
        product.price += 1
        if product.name == SPECIAL_FULL_COVERAGE
          if product.sell_in < 11
            product.price += 1 if product.price < 50
          elsif product.sell_in < 6 && product.price < 50
            product.price += 1
          end
        end
      end

      product.sell_in -= 1 if product.name != MEGA_COVERAGE

      if product.sell_in.negative?
        if product.name != FULL_COVERAGE
          if product.name != SPECIAL_FULL_COVERAGE
            if product.price > 0 && product.name != MEGA_COVERAGE
              product.price -= 1
            end
          else
            product.price = 0
          end
        end
      elsif product.price < 50
        product.price += 1
      end
    end

    products
  end

  private

  attr_reader :products

  FULL_COVERAGE = 'Full Coverage'
  SPECIAL_FULL_COVERAGE = 'Special Full Coverage'
  MEGA_COVERAGE = 'Mega Coverage'
end
