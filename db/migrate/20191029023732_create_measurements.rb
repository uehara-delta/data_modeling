class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :measurer, null: false, foreign_key: true
      t.datetime :measured_at

      t.timestamps
    end
  end
end
