class Program < ApplicationRecord
  has_many :program_names, dependent: :destroy
  has_many :regular_performers

  def performer_names_at(date)
    regular_performers_at(date).map{|rp| rp.entertainer.name_at(date) }
  end

  def performer_office_names_at(date)
    regular_performers_at(date).map{|rp| rp.entertainer.office_name_at(date) }.uniq
  end

  def name_at(date)
    program_names.
      where("(:date BETWEEN start_date AND end_date) OR " +
            "(start_date <= :date AND end_date IS NULL)", { date: date }).
      pluck(:name).first
  end

  private

    def regular_performers_at(date)
      regular_performers.
        where("(:date BETWEEN start_date AND end_date) OR " +
              "(start_date <= :date AND end_date IS NULL)", { date: date })
    end
end
