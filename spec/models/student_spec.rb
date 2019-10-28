# coding: utf-8
require 'rails_helper'

RSpec.describe Student, type: :model do

  it "nameがあれば有効な状態であること" do
    student = Student.new(name: '生徒 花子')
    expect(student).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    student = Student.new(name: nil)
    student.valid?
    expect(student.errors).to be_of_kind(:name, :blank)
  end
end
