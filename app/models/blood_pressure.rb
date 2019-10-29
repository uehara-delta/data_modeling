class BloodPressure < ApplicationRecord
  belongs_to :measurement
  has_one :measurer, through: :measurement

  validates :top_number, presence: true
  validates :bottom_number, presence: true

  def measured_at
    measurement.measured_at
  end
end
