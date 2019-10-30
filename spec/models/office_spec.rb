# coding: utf-8
require 'rails_helper'

RSpec.describe Office, type: :model do

  it "nameがあれば有効な状態であること" do
    office = Office.new(name: '講師 太郎')
    expect(office).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    office = Office.new(name: nil)
    office.valid?
    expect(office.errors).to be_of_kind(:name, :blank)
  end
end
