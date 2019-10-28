# coding: utf-8
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:instructor) { FactoryBot.create(:instructor) }
  let(:reservation) { FactoryBot.create(:reservation) }

  it "instructorとreservationとcommentがあれば有効な状態であること" do
    comment = instructor.comments.create(reservation: reservation, comment: 'よくできました')
    expect(comment).to be_valid
  end

  it "instructorがなければ無効な状態であること" do
    comment = Comment.new(reservation: reservation, comment: 'よくできました')
    comment.valid?
    expect(comment.errors).to be_of_kind(:instructor, :blank)
  end

  it "reservationがなければ無効な状態であること" do
    comment = instructor.comments.build(reservation: nil, comment: 'よくできました')
    comment.valid?
    expect(comment.errors).to be_of_kind(:reservation, :blank)
  end

  it "commentがなければ無効な状態であること" do
    comment = instructor.comments.create(reservation: reservation, comment: nil)
    comment.valid?
    expect(comment.errors).to be_of_kind(:comment, :blank)
  end

  it "同じreservationに複数のコメントは登録できないこと" do
    expect {
      instructor.comments.create(reservation: reservation, comment: '最初のコメント')
    }.to change { Comment.count }.by(1)

    comment = nil
    expect {
      comment = instructor.comments.create(reservation: reservation, comment: '２回めのコメント')
    }.not_to change { Comment.count }
    expect(comment.errors).to be_of_kind(:reservation, :taken)
  end
end
