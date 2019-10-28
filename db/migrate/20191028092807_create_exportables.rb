class CreateExportables < ActiveRecord::Migration[6.0]
  def change
    create_table :exportables do |t|
      t.references :product, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
