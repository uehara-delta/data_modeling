class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :instructor, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true, index: { unique: true }
      t.text :comment

      t.timestamps
    end
  end
end
