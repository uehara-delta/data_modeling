# coding: utf-8
require 'rails_helper'

RSpec.describe BodyTemperature, type: :model do
  let(:measurement) { FactoryBot.create(:measurement) }

  it "measurmentとvalueがあれば有効な状態であること" do
    body_temperature = BodyTemperature.new(measurement: measurement, value: 36.7)
    expect(body_temperature).to be_valid
  end

  it "measurementがなければ無効な状態であること" do
    body_temperature = BodyTemperature.new(measurement: nil, value: 36.7)
    body_temperature.valid?
    expect(body_temperature.errors).to be_of_kind(:measurement, :blank)
  end

  it "valueがなければ無効な状態であること" do
    body_temperature = BodyTemperature.new(measurement: measurement, value: nil)
    body_temperature.valid?
    expect(body_temperature.errors).to be_of_kind(:value, :blank)
  end
end
