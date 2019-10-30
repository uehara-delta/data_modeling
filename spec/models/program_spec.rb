# coding: utf-8
require 'rails_helper'

RSpec.describe Program, type: :model do
  it "有効な状態であること" do
    program = Program.new(start_date: '2017-09-10', end_date: '2019-04-01')
    expect(program).to be_valid
  end

  it "start_dateとend_dateがなくても有効な状態であること" do
    program = Program.new(start_date: nil, end_date: nil)
    expect(program).to be_valid
  end
end
