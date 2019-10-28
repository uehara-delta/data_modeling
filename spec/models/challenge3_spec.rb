# coding: utf-8
require 'rails_helper'

RSpec.describe '課題3', type: :model do
  let(:product_x) { FactoryBot.create(:product, name: 'product_x') }
  let(:product_y) { FactoryBot.create(:product, name: 'product_y') }
  let(:product_z) { FactoryBot.create(:product, name: 'product_z') }
  let(:country_a) { FactoryBot.create(:country, name: 'country_a') }
  let(:country_b) { FactoryBot.create(:country, name: 'country_b') }
  let(:country_c) { FactoryBot.create(:country, name: 'country_c') }

  it "部品はある国に対して輸出可能かどうかを判定できること" do
    Exportable.create(product: product_x, country: country_a)
    Exportable.create(product: product_x, country: country_c)

    expect(product_x.can_export?(country_a)).to be true
    expect(product_x.can_export?(country_b)).to be false
    expect(product_x.can_export?(country_c)).to be true
  end

  it "ある部品に対して輸出可能な国の一覧を取得できること" do
    Exportable.create(product: product_x, country: country_a)
    Exportable.create(product: product_x, country: country_c)

    expect(product_x.exportable_countries.map{|country| country.name }).to eq %w(country_a country_c)
  end

  it "ある国に対して輸出可能な部品の一覧を取得できること" do
    Exportable.create(product: product_x, country: country_a)
    Exportable.create(product: product_z, country: country_a)

    expect(country_a.importable_products.map{|product| product.name }).to eq %w(product_x product_z)
  end
end
