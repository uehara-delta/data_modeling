# coding: utf-8
require 'rails_helper'

RSpec.describe '課題1', type: :model do
  let(:instructor) { FactoryBot.create(:instructor) }
  let(:student) { FactoryBot.create(:student) }
  let(:lesson) { FactoryBot.create(:lesson, instructor: instructor) }

  it "講師はレッスンを登録することができる" do
    lesson = instructor.lessons.create(name: 'データモデリング入門')
    expect(lesson).to be_valid
  end

  it "レッスンにはレッスン日時を設定することができる" do
    lesson = instructor.lessons.create(name: 'データモデリング入門')
    lesson.date_time = Time.zone.parse('2019-11-12 14:00:00 JST')
    expect(lesson.save).to be true
    expect(Lesson.first.date_time.to_s).to eq '2019-11-12 05:00:00 UTC'
  end

  it "レッスンにはレッスン日時を設定することができる(登録と同時に指定)" do
    lesson = instructor.lessons.create(name: 'データモデリング入門', date_time: Time.zone.parse('2019-11-12 14:00:00 JST'))
    expect(lesson).to be_valid
    expect(Lesson.first.date_time.to_s).to eq '2019-11-12 05:00:00 UTC'
  end

  it "生徒はレッスンを予約することができる" do
    reservation = student.reservations.create(lesson: lesson)
    expect(reservation).to be_valid
    expect(student.lessons.first.name).to eq lesson.name
    expect(student.lessons.first.date_time).to eq lesson.date_time
  end

  it "レッスン後、講師は生徒にレッスンコメントを返すことができる" do
    reservation = student.reservations.create(lesson: lesson)
    comment = instructor.comments.create(reservation: reservation, comment: 'よくできていました')
    expect(comment).to be_valid
    expect(comment.lesson.name).to eq lesson.name
    expect(comment.student.name).to eq student.name
  end

  it "生徒はレッスン予約をキャンセルすることができる" do
    reservation = student.reservations.create(lesson: lesson)
    expect(reservation.update(canceled: true)).to be true
    expect(reservation.reload.canceled?).to be true
  end
end
