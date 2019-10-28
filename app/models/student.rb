class Student < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :lessons, through: :reservations

  validates :name, presence: true
end
