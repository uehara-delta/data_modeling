class Entertainer < ApplicationRecord
  has_many :entertainer_names, dependent: :destroy
  has_many :retular_performers
  has_many :belongings

  def name_at(date)
    entertainer_names.
      where("(:date BETWEEN start_date AND end_date) OR " +
            "(start_date IS NULL AND :date <= end_date) OR " +
            "(start_date <= :date AND end_date IS NULL) OR " +
            "(start_date IS NULL AND end_date IS NULL)", { date: date }).
      pluck(:name).first
  end

  def office_name_at(date)
    belongings.
      joins(:office).
      where("(:date BETWEEN start_date AND end_date) OR " +
            "(start_date IS NULL AND :date <= end_date) OR " +
            "(start_date <= :date AND end_date IS NULL) OR " +
            "(start_date IS NULL AND end_date IS NULL)", { date: date }).
      pluck("offices.name").first
  end
end
