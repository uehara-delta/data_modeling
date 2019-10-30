FactoryBot.define do
  factory :program_name do
    name { "Test Program" }
    start_date { "2019-10-29" }
    end_date { "2019-10-29" }
    association :program
  end
end
