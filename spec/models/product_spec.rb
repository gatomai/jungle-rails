require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Validations' do
    it 'validates presence of all values' do
      cat1 = Category.create(id: 1)
      prod = Product.new(name:'Hipster Mouse', description: 'Some description',category_id: 1,price: 100,quantity: 10)      
      expect(prod.valid?).to eq(true)
    end

    it 'validates presence of name' do
      cat1 = Category.create(id: 1)
      prod = Product.new(description: 'Some description',category_id: 1,quantity: 10,price: 100)
      expect(prod.valid?).to eq(false)
      expect(prod.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'validates presence of price' do
      cat1 = Category.create(id: 1)
      prod = Product.new(name:'Hipster Mouse', description: 'Some description',category_id: 1,quantity: 10)
      expect(prod.valid?).to eq(false)
      expect(prod.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates presence of quantity' do
      cat1 = Category.create(id: 1)
      prod = Product.new(name:'Hipster Mouse', description: 'Some description',category_id: 1,price: 100)      
      expect(prod.valid?).to eq(false)
      expect(prod.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'validates presence of category' do
      cat1 = Category.create(id: 1)
      prod = Product.new(name:'Hipster Mouse', description: 'Some description',price: 100,quantity: 10)      
      expect(prod.valid?).to eq(false)
      expect(prod.errors.full_messages).to eq(["Category can't be blank"])
    end

  end
end



