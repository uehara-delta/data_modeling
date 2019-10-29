class Measurement < ApplicationRecord
  has_many :body_temperatures
  has_many :pulses
  has_many :blood_pressures

  belongs_to :patient
  belongs_to :measurer

  validates :measured_at, presence: true
end
