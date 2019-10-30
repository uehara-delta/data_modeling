FactoryBot.define do
  factory :entertainer_name do
    name { "Test Entertainer" }
    start_date { "2019-10-29" }
    end_date { "2019-10-29" }
    association :entertainer
  end
end
