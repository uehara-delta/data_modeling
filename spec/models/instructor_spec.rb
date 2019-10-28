# coding: utf-8
require 'rails_helper'

RSpec.describe Instructor, type: :model do

  it "nameがあれば有効な状態であること" do
    instructor = Instructor.new(name: '講師 太郎')
    expect(instructor).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    instructor = Instructor.new(name: nil)
    instructor.valid?
    expect(instructor.errors).to be_of_kind(:name, :blank)
  end
end
