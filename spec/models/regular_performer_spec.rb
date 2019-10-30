# coding: utf-8
require 'rails_helper'

RSpec.describe RegularPerformer, type: :model do
  let(:program) { FactoryBot.create(:program) }
  let(:entertainer) { FactoryBot.create(:entertainer) }

  it "programとentertainerとstart_dateがあれば有効な状態であること" do
    regular_performer = RegularPerformer.new(program: program, entertainer: entertainer, start_date: '2017-09-01', end_date: nil)
    expect(regular_performer).to be_valid
  end

  it "programがなければ無効な状態であること" do
    regular_performer = RegularPerformer.new(program: nil, entertainer: entertainer, start_date: '2017-09-01', end_date: '2019-04-01')
    regular_performer.valid?
    expect(regular_performer.errors).to be_of_kind(:program, :blank)
  end

  it "entertainerがなければ無効な状態であること" do
    regular_performer = RegularPerformer.new(program: program, entertainer: nil, start_date: '2017-09-01', end_date: '2019-04-01')
    regular_performer.valid?
    expect(regular_performer.errors).to be_of_kind(:entertainer, :blank)
  end

  it "start_dateがなければ無効な状態であること" do
    regular_performer = RegularPerformer.new(program: program, entertainer: entertainer, start_date: nil, end_date: '2019-04-01')
    regular_performer.valid?
    expect(regular_performer.errors).to be_of_kind(:start_date, :blank)
  end
end
