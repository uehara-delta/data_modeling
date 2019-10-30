class EntertainerName < ApplicationRecord
  belongs_to :entertainer
  default_scope { order(:end_date) }
end
