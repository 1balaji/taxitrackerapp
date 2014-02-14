class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.decimal :lon, scale: 15, precision: 15
      t.decimal :lat, scale: 15, precision: 15
      t.datetime :logged_at
      t.integer :user_id

      t.timestamps
    end
  end
end
