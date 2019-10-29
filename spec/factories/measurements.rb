FactoryBot.define do
  factory :measurement do
    association :patient
    association :measurer
    measured_at { "2019-10-29 11:37:32" }
  end
end
