# coding: utf-8
FactoryBot.define do
  factory :lesson do
    sequence(:name) { |n| "Lesson#{n}" }
    association :instructor
  end
end
