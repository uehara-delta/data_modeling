class CreateBodyTemperatures < ActiveRecord::Migration[6.0]
  def change
    create_table :body_temperatures do |t|
      t.float :value
      t.references :measurement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
