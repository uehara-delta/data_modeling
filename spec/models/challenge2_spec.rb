# coding: utf-8
require 'rails_helper'

RSpec.describe '課題2', type: :model do
  let(:user1) { FactoryBot.create(:user, name: 'user1') }
  let(:user2) { FactoryBot.create(:user, name: 'user2') }
  let(:user3) { FactoryBot.create(:user, name: 'user3') }

  it "ユーザーは他のユーザーをフォローすることができる" do
    user1.follow(user2)
    expect(user1.following.count).to eq 1
    expect(user1.followers.count).to eq 0
    expect(user2.following.count).to eq 0
    expect(user2.followers.count).to eq 1
  end

  it "ユーザーはフォローしているユーザーの一覧を見ることができる" do
    user1.follow(user2)
    user1.follow(user3)
    user3.follow(user2)
    user2.follow(user1)

    expect(user1.following.map{|u| u.name }).to eq %w(user2 user3)
    expect(user2.following.map{|u| u.name }).to eq %w(user1)
    expect(user3.following.map{|u| u.name }).to eq %w(user2)
  end

  it "ユーザーはフォローしてくれているユーザーの一覧を見ることができる" do
    user1.follow(user2)
    user1.follow(user3)
    user3.follow(user2)
    user2.follow(user1)

    expect(user1.followers.map{|u| u.name }).to eq %w(user2)
    expect(user2.followers.map{|u| u.name }).to eq %w(user1 user3)
    expect(user3.followers.map{|u| u.name }).to eq %w(user1)
  end
end
