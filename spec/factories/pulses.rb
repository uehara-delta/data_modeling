FactoryBot.define do
  factory :pulse do
    value { 1.5 }
    association :measurement
  end
end
