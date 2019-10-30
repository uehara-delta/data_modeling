FactoryBot.define do
  factory :regular_performer do
    association :program
    association :entertainment
    start_date { "2019-10-29" }
    end_date { "2019-10-29" }
  end
end
