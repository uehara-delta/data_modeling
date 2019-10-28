# coding: utf-8
require 'rails_helper'

RSpec.describe Exportable, type: :model do
  let(:product) { FactoryBot.create(:product) }
  let(:country) { FactoryBot.create(:country) }

  it "productとcountryがあれば有効な状態であること" do
    exportable = Exportable.new(product: product, country: country)
    expect(exportable).to be_valid
  end

  it "productがなければ無効な状態であること" do
    exportable = Exportable.new(product: nil, country: country)
    exportable.valid?
    expect(exportable.errors).to be_of_kind(:product, :blank)
  end

  it "countryがなければ無効な状態であること" do
    exportable = Exportable.new(product: product, country: nil)
    exportable.valid?
    expect(exportable.errors).to be_of_kind(:country, :blank)
  end
end
