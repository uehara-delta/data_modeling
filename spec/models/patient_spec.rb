# coding: utf-8
require 'rails_helper'

RSpec.describe Patient, type: :model do

  it "nameがあれば有効な状態であること" do
    patient = Patient.new(name: '患者 太郎')
    expect(patient).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    patient = Patient.new(name: nil)
    patient.valid?
    expect(patient.errors).to be_of_kind(:name, :blank)
  end
end
