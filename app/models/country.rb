class Country < ApplicationRecord
  has_many :_exportable, class_name: "Exportable"
  has_many :importable_products, through: :_exportable, source: :product

  validates :name, presence: true
end
