# frozen_string_literal: true

require_relative '../../models/product'
require_relative '../../models/car_insurance'

RSpec.describe(CarInsurance) do
  describe '#update_price' do
    let(:product) { Product.new('foo', 0, 0) }
    let(:car_insurance) { CarInsurance.new([product]) }

    it 'should foo' do
      products = car_insurance.update_price
      expect(products[0].name).to eq('fixme')
    end
  end
end
