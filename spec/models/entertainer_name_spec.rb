# coding: utf-8
require 'rails_helper'

RSpec.describe EntertainerName, type: :model do
  let(:entertainer) { FactoryBot.create(:entertainer) }

  it "nameがあれば有効な状態であること" do
    entertainer_name = EntertainerName.new(name: 'an entertainer', start_date: nil, end_date: nil, entertainer: entertainer)
    expect(entertainer_name).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    instructor = Instructor.new(name: nil)
    instructor.valid?
    expect(instructor.errors).to be_of_kind(:name, :blank)
  end
end
