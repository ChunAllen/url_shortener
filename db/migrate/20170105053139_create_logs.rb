class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.integer :url_id, index: true, null: false
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
    end
  end
end
