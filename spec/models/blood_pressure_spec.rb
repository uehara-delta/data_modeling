# coding: utf-8
require 'rails_helper'

RSpec.describe BloodPressure, type: :model do
  let(:measurement) { FactoryBot.create(:measurement) }

  it "measurementとtop_numberとbottom_numberがあれば有効な状態であること" do
    blood_pressure = BloodPressure.new(measurement: measurement, top_number: 120, bottom_number: 80)
    expect(blood_pressure).to be_valid
  end

  it "measurementがなければ無効な状態であること" do
    blood_pressure = BloodPressure.new(measurement: nil, top_number: 120, bottom_number: 80)
    blood_pressure.valid?
    expect(blood_pressure.errors).to be_of_kind(:measurement, :blank)
  end

  it "top_numberがなければ無効な状態であること" do
    blood_pressure = BloodPressure.new(measurement: measurement, top_number: nil, bottom_number: 80)
    blood_pressure.valid?
    expect(blood_pressure.errors).to be_of_kind(:top_number, :blank)
  end

  it "bottom_numberがなければ無効な状態であること" do
    blood_pressure = BloodPressure.new(measurement: measurement, top_number: 120, bottom_number: nil)
    blood_pressure.valid?
    expect(blood_pressure.errors).to be_of_kind(:bottom_number, :blank)
  end
end
