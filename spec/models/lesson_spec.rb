# coding: utf-8
require 'rails_helper'

RSpec.describe Lesson, type: :model do
  let(:instructor) { FactoryBot.create(:instructor) }

  it "nameがあれば有効な状態であること" do
    lesson = instructor.lessons.build(name: "データモデリング入門")
    expect(lesson).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    lesson = instructor.lessons.build(name: nil)
    lesson.valid?
    expect(lesson.errors).to be_of_kind(:name, :blank)
  end
end
