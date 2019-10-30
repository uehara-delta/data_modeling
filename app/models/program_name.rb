class ProgramName < ApplicationRecord
  belongs_to :program

  default_scope { order(:end_date) }

  validates :name, presence: true
  validates :start_date, presence: true
end
