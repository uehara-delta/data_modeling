FactoryBot.define do
  factory :reservation do
    association :student
    association :lesson
  end
end
