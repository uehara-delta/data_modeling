class CreateBloodPressures < ActiveRecord::Migration[6.0]
  def change
    create_table :blood_pressures do |t|
      t.integer :top_number
      t.integer :bottom_number
      t.references :measurement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
