# coding: utf-8
require 'rails_helper'

RSpec.describe Measurement, type: :model do
  let(:patient) { FactoryBot.create(:patient) }
  let(:measurer) { FactoryBot.create(:measurer) }

  it "patinetとmeasurerとmeasured_atがあれば有効な状態であること" do
    measurement = Measurement.new(patient: patient, measurer: measurer, measured_at: Time.zone.now)
    expect(measurement).to be_valid
  end

  it "patientがなければ無効な状態であること" do
    measurement = Measurement.new(patient: nil, measurer: measurer, measured_at: Time.zone.now)
    measurement.valid?
    expect(measurement.errors).to be_of_kind(:patient, :blank)
  end

  it "mesurerがなければ無効な状態であること" do
    measurement = Measurement.new(patient: patient, measurer: nil, measured_at: Time.zone.now)
    measurement.valid?
    expect(measurement.errors).to be_of_kind(:measurer, :blank)
  end

  it "mesured_atがなければ無効な状態であること" do
    measurement = Measurement.new(patient: patient, measurer: measurer, measured_at: nil)
    measurement.valid?
    expect(measurement.errors).to be_of_kind(:measured_at, :blank)
  end
end
