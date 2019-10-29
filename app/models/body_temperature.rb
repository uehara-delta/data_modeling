class BodyTemperature < ApplicationRecord
  belongs_to :measurement
  has_one :measurer, through: :measurement

  validates :value, presence: true

  def measured_at
    measurement.measured_at
  end
end
