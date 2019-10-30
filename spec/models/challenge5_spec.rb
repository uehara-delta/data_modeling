# coding: utf-8
require 'rails_helper'

RSpec.describe '課題5', type: :model do
  let(:program) { FactoryBot.create(:program, start_date: "2010-04-01", end_date: nil) }
  let(:entertainer1) { FactoryBot.create(:entertainer) }
  let(:entertainer2) { FactoryBot.create(:entertainer) }
  let(:office1) { FactoryBot.create(:office, name: "office1") }
  let(:office2) { FactoryBot.create(:office, name: "office2") }
  let(:office3) { FactoryBot.create(:office, name: "office3") }

  it "芸能人の名前は期間によって変わる" do
    entertainer1.entertainer_names.create(name: "entertainer1-1", start_date: nil, end_date: "2016-12-31")
    entertainer1.entertainer_names.create(name: "entertainer1-2", start_date: "2017-01-01", end_date: "2017-09-30")
    entertainer1.entertainer_names.create(name: "entertainer1-3", start_date: "2017-10-01", end_date: nil)
    entertainer2.entertainer_names.create(name: "entertainer2", start_date: nil, end_date: nil)

    aggregate_failures do
      expect(entertainer1.name_at("2016-01-01")).to eq "entertainer1-1"
      expect(entertainer1.name_at("2016-12-31")).to eq "entertainer1-1"
      expect(entertainer1.name_at("2017-01-01")).to eq "entertainer1-2"
      expect(entertainer1.name_at("2017-04-01")).to eq "entertainer1-2"
      expect(entertainer1.name_at("2017-09-30")).to eq "entertainer1-2"
      expect(entertainer1.name_at("2017-10-01")).to eq "entertainer1-3"
      expect(entertainer1.name_at("2019-10-01")).to eq "entertainer1-3"
    end
  end

  it "番組に名前も期間によって変わる" do
    program.program_names.create(name: "program 1", start_date: "2010-04-01", end_date: "2016-09-30")
    program.program_names.create(name: "program 2", start_date: "2016-10-01", end_date: nil)

    aggregate_failures do
      expect(program.name_at("2010-04-01")).to eq "program 1"
      expect(program.name_at("2016-09-30")).to eq "program 1"
      expect(program.name_at("2016-10-01")).to eq "program 2"
      expect(program.name_at("2019-04-01")).to eq "program 2"
    end
  end

  it "ある番組でレギュラー出演している芸能人を管理できること" do
    program.program_names.create(name: "program 1", start_date: "2010-04-01", end_date: "2016-09-30")
    program.program_names.create(name: "program 2", start_date: "2016-10-01", end_date: nil)

    program.regular_performers.create(entertainer: entertainer1, start_date: "2010-04-01", end_date: "2018-10-31")
    program.regular_performers.create(entertainer: entertainer2, start_date: "2013-10-01", end_date: nil)

    entertainer1.entertainer_names.create(name: "entertainer1-1", start_date: nil, end_date: "2016-12-31")
    entertainer1.entertainer_names.create(name: "entertainer1-2", start_date: "2017-01-01", end_date: "2017-09-30")
    entertainer1.entertainer_names.create(name: "entertainer1-3", start_date: "2017-10-01", end_date: nil)
    entertainer2.entertainer_names.create(name: "entertainer2", start_date: nil, end_date: nil)

    entertainer1.belongings.create(office: office1, start_date: nil, end_date: "2017-09-30")
    entertainer1.belongings.create(office: office2, start_date: "2017-10-01", end_date: "2018-03-31")
    entertainer1.belongings.create(office: office3, start_date: "2018-04-01", end_date: nil)
    entertainer2.belongings.create(office: office2, start_date: nil, end_date: nil)

    # ある時点でレギュラー出演している芸能人を、その時の名前、その時の所属事務所で把握したい
    aggregate_failures do
      expect(program.performer_names_at("2010-04-01")).to contain_exactly *%w(entertainer1-1)
      expect(program.performer_names_at("2014-04-01")).to contain_exactly *%w(entertainer1-1 entertainer2)
      expect(program.performer_names_at("2017-04-01")).to contain_exactly *%w(entertainer1-2 entertainer2)
      expect(program.performer_names_at("2018-04-01")).to contain_exactly *%w(entertainer1-3 entertainer2)
      expect(program.performer_names_at("2019-04-01")).to contain_exactly *%w(entertainer2)
    end

    aggregate_failures do
      expect(program.performer_office_names_at("2010-04-01")).to contain_exactly *%w(office1)
      expect(program.performer_office_names_at("2014-04-01")).to contain_exactly *%w(office1 office2)
      expect(program.performer_office_names_at("2017-10-01")).to contain_exactly *%w(office2)
      expect(program.performer_office_names_at("2018-04-01")).to contain_exactly *%w(office2 office3)
      expect(program.performer_office_names_at("2019-04-01")).to contain_exactly *%w(office2)
    end
  end
end
