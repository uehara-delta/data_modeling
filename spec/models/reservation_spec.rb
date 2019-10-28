# coding: utf-8
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:student) { FactoryBot.create(:student) }
  let(:lesson) { FactoryBot.create(:lesson) }

  it "studentとlessonがあれば有効な状態であること" do
    reservation = Reservation.new(student: student, lesson: lesson)
    expect(reservation).to be_valid
  end

  it "studentがなければ無効な状態であること" do
    reservation = Reservation.new(student: nil, lesson: lesson)
    reservation.valid?
    expect(reservation.errors).to be_of_kind(:student, :blank)
  end

  it "lessonがなければ無効な状態であること" do
    reservation = Reservation.new(student: student, lesson: nil)
    reservation.valid?
    expect(reservation.errors).to be_of_kind(:lesson, :blank)
  end
end
