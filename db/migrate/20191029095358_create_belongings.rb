class CreateBelongings < ActiveRecord::Migration[6.0]
  def change
    create_table :belongings do |t|
      t.references :entertainer, null: false, foreign_key: true
      t.references :office, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
