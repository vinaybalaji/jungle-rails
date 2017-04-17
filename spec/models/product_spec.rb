require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save with all valid fields' do 
      product = Product.new(
        name: 'Chair',
        price: 80,
        quantity: 5, 
        category: Category.find(1)
      )
      expect(product).to(be_valid)
    end
    it 'should not save without a name' do 
      product = Product.new(
        name: nil,
        price: 80,
        quantity: 5, 
        category: Category.find(1)
      )
      expect(product).to_not(be_valid)
    end
    it 'should not save without a price' do 
      product = Product.new(
        name: 'Chair',
        price: nil,
        quantity: 5, 
        category: Category.find(1)
      )
      expect(product).to_not(be_valid)
    end
    it 'should not save without a quantity' do 
      product = Product.new(
        name: 'Chair',
        price: 80,
        quantity: nil, 
        category: Category.find(1)
      )
      expect(product).to_not(be_valid)
    end
    it 'should not save without a quantity' do 
      product = Product.new(
        name: 'Chair',
        price: 80,
        quantity: 5, 
        category: nil
      )
      expect(product).to_not(be_valid)
    end
  end
end
