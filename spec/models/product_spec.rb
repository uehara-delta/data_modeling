# coding: utf-8
require 'rails_helper'

RSpec.describe Product, type: :model do

  it "nameがあれば有効な状態であること" do
    product = Product.new(name: 'US')
    expect(product).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    product = Product.new(name: nil)
    product.valid?
    expect(product.errors).to be_of_kind(:name, :blank)
  end
end
