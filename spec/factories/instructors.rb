# coding: utf-8
FactoryBot.define do
  factory :instructor do
    sequence(:name) { |n| "Instructor#{n}" }
  end
end
