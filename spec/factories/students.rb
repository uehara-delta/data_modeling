# coding: utf-8
FactoryBot.define do
  factory :student do
    sequence(:name) { |n| "Student#{n}" }
  end
end
