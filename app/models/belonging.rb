class Belonging < ApplicationRecord
  belongs_to :entertainer
  belongs_to :office

  default_scope { order(:end_date) }
end
