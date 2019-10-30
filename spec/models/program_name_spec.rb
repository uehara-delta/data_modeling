# coding: utf-8
require 'rails_helper'

RSpec.describe ProgramName, type: :model do
  let(:program) { FactoryBot.create(:program) }

  it "programとnameとstart_dateがあれば有効な状態であること" do
    program_name = ProgramName.new(program: program, name: 'program name', start_date: '2017-09-01', end_date: nil)
    expect(program_name).to be_valid
  end

  it "programがなければ無効な状態であること" do
    program_name = ProgramName.new(program: nil, name: 'program name', start_date: '2017-09-01', end_date: '2019-04-01')
    program_name.valid?
    expect(program_name.errors).to be_of_kind(:program, :blank)
  end

  it "nameがなければ無効な状態であること" do
    program_name = ProgramName.new(program: program, name: nil, start_date: '2017-09-01', end_date: '2019-04-01')
    program_name.valid?
    expect(program_name.errors).to be_of_kind(:name, :blank)
  end

  it "start_dateがなければ無効な状態であること" do
    program_name = ProgramName.new(program: program, name: 'program name', start_date: nil, end_date: '2019-04-01')
    program_name.valid?
    expect(program_name.errors).to be_of_kind(:start_date, :blank)
  end
end
