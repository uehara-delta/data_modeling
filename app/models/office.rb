class Office < ApplicationRecord
  has_many :belongings

  validates :name, presence: true
end
