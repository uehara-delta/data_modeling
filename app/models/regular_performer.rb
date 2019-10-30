class RegularPerformer < ApplicationRecord
  belongs_to :program
  belongs_to :entertainer

  default_scope { order(:end_date) }

  validates :start_date, presence: true
end
