class Product < ApplicationRecord
  has_many :exportables, dependent: :destroy
  has_many :exportable_countries, through: :exportables, source: :country

  validates :name, presence: true

  def can_export?(country)
    exportable_countries.include?(country)
  end
end
