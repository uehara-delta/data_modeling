FactoryBot.define do
  factory :blood_pressure do
    top_number { 1 }
    bottom_number { 1 }
    association :measurement
  end
end
