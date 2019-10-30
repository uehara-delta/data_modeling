class CreateRegularPerformers < ActiveRecord::Migration[6.0]
  def change
    create_table :regular_performers do |t|
      t.references :program, null: false, foreign_key: true
      t.references :entertainer, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
