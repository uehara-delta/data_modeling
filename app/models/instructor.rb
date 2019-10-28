class Instructor < ApplicationRecord
  has_many :lessons
  has_many :comments

  validates :name, presence: true
end
