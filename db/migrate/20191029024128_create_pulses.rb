class CreatePulses < ActiveRecord::Migration[6.0]
  def change
    create_table :pulses do |t|
      t.integer :value
      t.references :measurement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
