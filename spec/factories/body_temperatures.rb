FactoryBot.define do
  factory :body_temperature do
    value { 1.5 }
    association :measurement
  end
end
