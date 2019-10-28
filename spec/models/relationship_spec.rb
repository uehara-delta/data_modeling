# coding: utf-8
require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user1) { FactoryBot.create(:user, name: 'user1') }
  let(:user2) { FactoryBot.create(:user, name: 'user2') }

  it "followerとfollowedがあれば有効な状態であること" do
    relationship = Relationship.new(follower: user1, followed: user2)
    expect(relationship).to be_valid
  end

  it "followerがなければ無効な状態であること" do
    relationship = Relationship.new(follower: nil, followed: user2)
    relationship.valid?
    expect(relationship.errors).to be_of_kind(:follower, :blank)
  end

  it "followedがなければ無効な状態であること" do
    relationship = Relationship.new(follower: user1, followed: nil)
    relationship.valid?
    expect(relationship.errors).to be_of_kind(:followed, :blank)
  end
end
