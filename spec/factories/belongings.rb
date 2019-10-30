FactoryBot.define do
  factory :belonging do
    association :entertainer
    association :office
    start_date { "2019-10-29" }
    end_date { "2019-10-29" }
  end
end
