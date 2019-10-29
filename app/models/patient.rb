class Patient < ApplicationRecord
  has_many :measurements

  validates :name, presence: true

  def latest_body_temperature
    BodyTemperature.joins(:measurement).where(measurements: { patient: self }).order(:measured_at).last
  end

  def latest_pulse
    Pulse.joins(:measurement).where(measurements: { patient: self }).order(:measured_at).last
  end

  def latest_blood_pressure
    BloodPressure.joins(:measurement).where(measurements: { patient: self }).order(:measured_at).last
  end
end
