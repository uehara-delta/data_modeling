# coding: utf-8
require 'rails_helper'

RSpec.describe '課題4', type: :model do
  let(:patient) { FactoryBot.create(:patient) }
  let(:measurer1) { FactoryBot.create(:measurer, name: "measure1") }
  let(:measurer2) { FactoryBot.create(:measurer, name: "measure2") }

  it "患者の体温、脈拍、血圧(上下)、測定者と測定時刻が記録できること" do
    measurement = patient.measurements.create(measurer: measurer1, measured_at: Time.zone.parse('2019-10-29 10:14:00 JST'))
    measurement.body_temperatures.create(value: 36.3)
    measurement.pulses.create(value: 76)
    measurement.blood_pressures.create(top_number: 120, bottom_number: 80)

    expect(measurement).to be_valid
  end

  it "体温と脈拍だけ記録することもできること" do
    measurement = patient.measurements.create(measurer: measurer1, measured_at: Time.zone.parse('2019-10-29 10:14:00 JST'))
    measurement.body_temperatures.create(value: 36.3)
    measurement.pulses.create(value: 76)

    expect(measurement).to be_valid
  end

  it "誰が計測したかは記録として残せること" do
    measurement = patient.measurements.create(measurer: measurer1, measured_at: Time.zone.parse('2019-10-29 10:14:00 JST'))
    measurement.body_temperatures.create(value: 36.3)
    measurement.pulses.create(value: 76)
    measurement.blood_pressures.create(top_number: 120, bottom_number: 80)

    expect(measurement).to be_valid
    expect(Measurement.first.patient.id).to eq patient.id
    expect(Measurement.first.measurer.id).to eq measurer1.id
  end

  it "各計測項目に対して、最新の値と計測者を取得できること" do
    measurement1 = patient.measurements.create(measurer: measurer1, measured_at: Time.zone.parse('2019-10-29 10:14:00 JST'))
    measurement1.body_temperatures.create(value: 36.3)
    measurement1.pulses.create(value: 76)
    measurement1.blood_pressures.create(top_number: 120, bottom_number: 80)

    measurement2 = patient.measurements.create(measurer: measurer2, measured_at: Time.zone.parse('2019-10-30 09:58:00 JST'))
    measurement2.body_temperatures.create(value: 36.6)
    measurement2.blood_pressures.create(top_number: 118, bottom_number: 72)

    body_temperature = patient.latest_body_temperature
    expect(body_temperature.value).to eq 36.6
    expect(body_temperature.measured_at).to eq Time.zone.parse('2019-10-30 09:58:00 JST')
    expect(body_temperature.measurer.name).to eq measurer2.name

    pulse = patient.latest_pulse
    expect(pulse.value).to eq 76
    expect(pulse.measured_at).to eq Time.zone.parse('2019-10-29 10:14:00 JST')
    expect(pulse.measurer.name).to eq measurer1.name

    blood_pressure = patient.latest_blood_pressure
    expect(blood_pressure.top_number).to eq 118
    expect(blood_pressure.bottom_number).to eq 72
    expect(blood_pressure.measured_at).to eq Time.zone.parse('2019-10-30 09:58:00 JST')
    expect(blood_pressure.measurer.name).to eq measurer2.name
  end
end
