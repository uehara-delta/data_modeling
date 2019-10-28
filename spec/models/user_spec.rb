# coding: utf-8
require 'rails_helper'

RSpec.describe User, type: :model do

  it "nameがあれば有効な状態であること" do
    user = User.new(name: 'テストユーザー')
    expect(user).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors).to be_of_kind(:name, :blank)
  end
end
