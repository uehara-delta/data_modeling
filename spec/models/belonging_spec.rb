# coding: utf-8
require 'rails_helper'

RSpec.describe Belonging, type: :model do
  let(:entertainer) { FactoryBot.create(:entertainer) }
  let(:office) { FactoryBot.create(:office) }

  it "entertainerとofficeがあれば有効な状態であること" do
    belonging = Belonging.new(entertainer: entertainer, office: office, start_date: nil, end_date: nil)
    expect(belonging).to be_valid
  end

  it "entertainerがなければ無効な状態であること" do
    belonging = Belonging.new(entertainer: nil, office: office, start_date: '2018-10-29', end_date: '2019-10-29')
    belonging.valid?
    expect(belonging.errors).to be_of_kind(:entertainer, :blank)
  end

  it "officeがなければ無効な状態であること" do
    belonging = Belonging.new(entertainer: entertainer, office: nil, start_date: '2018-10-29', end_date: '2019-10-29')
    belonging.valid?
    expect(belonging.errors).to be_of_kind(:office, :blank)
  end
end
