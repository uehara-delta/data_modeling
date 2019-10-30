# coding: utf-8
require 'rails_helper'

RSpec.describe Entertainer, type: :model do

  it "有効な状態であること" do
    entertainer = Entertainer.new()
    expect(entertainer).to be_valid
  end
end
