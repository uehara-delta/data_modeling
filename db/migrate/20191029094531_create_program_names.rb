class CreateProgramNames < ActiveRecord::Migration[6.0]
  def change
    create_table :program_names do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
