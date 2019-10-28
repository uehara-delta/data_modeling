class Comment < ApplicationRecord
  belongs_to :instructor
  belongs_to :reservation

  has_one :lesson, through: :reservation
  has_one :student, through: :reservation

  validates :comment, presence: true
  validates :reservation, uniqueness: true
end
