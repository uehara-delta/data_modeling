class Lesson < ApplicationRecord
  belongs_to :instructor

  validates :name, presence: true
end
