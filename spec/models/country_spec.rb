# coding: utf-8
require 'rails_helper'

RSpec.describe Country, type: :model do

  it "nameがあれば有効な状態であること" do
    country = Country.new(name: 'US')
    expect(country).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    country = Country.new(name: nil)
    country.valid?
    expect(country.errors).to be_of_kind(:name, :blank)
  end
end
