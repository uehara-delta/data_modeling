FactoryBot.define do
  factory :comment do
    association :instructor
    association :reservation
    sequence(:comment) { |n| "Comment#{n}" }
  end
end
