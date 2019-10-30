class CreateEntertainers < ActiveRecord::Migration[6.0]
  def change
    create_table :entertainers do |t|

      t.timestamps
    end
  end
end
