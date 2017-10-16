require 'rails_helper'

RSpec.describe Product, type: :model do

  describe '.product' do
    before(:each) do
      @product = Product.new
      @category = Category.new name: 'Apparel'
    end

    it 'should save with all fields filled in' do
      @full_product = Product.new(name: 'a', price: '3449', quantity: '3', category: @category)
      @full_product.save!
      expect(@full_product).to be_valid
    end

    it 'should be invalid without a name' do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:name]).to include('can\'t be blank')
    end

    it 'should be invalid without a price' do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:price]).to include('can\'t be blank')
    end

    it 'should be invalid without a quantity' do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:quantity]).to include('can\'t be blank')
    end

    it 'should be invalid without a category' do
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:category]).to include("can\'t be blank")
    end
  end
  
end
