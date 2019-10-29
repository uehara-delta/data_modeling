# coding: utf-8
require 'rails_helper'

RSpec.describe Pulse, type: :model do
  let(:measurement) { FactoryBot.create(:measurement) }

  it "measurmentとvalueがあれば有効な状態であること" do
    pulse = Pulse.new(measurement: measurement, value: 36.7)
    expect(pulse).to be_valid
  end

  it "measurementがなければ無効な状態であること" do
    pulse = Pulse.new(measurement: nil, value: 36.7)
    pulse.valid?
    expect(pulse.errors).to be_of_kind(:measurement, :blank)
  end

  it "valueがなければ無効な状態であること" do
    pulse = Pulse.new(measurement: measurement, value: nil)
    pulse.valid?
    expect(pulse.errors).to be_of_kind(:value, :blank)
  end
end
