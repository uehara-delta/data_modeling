# coding: utf-8
require 'rails_helper'

RSpec.describe Measurer, type: :model do

  it "nameがあれば有効な状態であること" do
    measurer = Measurer.new(name: '看護 太郎')
    expect(measurer).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    measurer = Measurer.new(name: nil)
    measurer.valid?
    expect(measurer.errors).to be_of_kind(:name, :blank)
  end
end
