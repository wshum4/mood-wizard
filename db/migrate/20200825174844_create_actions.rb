class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :url
      t.string :action_type
      t.integer :sad_happy, array: true
      t.integer :angry_calm, array: true
      t.integer :lowenergy_highenergy, array: true
      t.integer :anxious_social, array: true
      t.integer :duration
      t.string :time_of_day, array: true
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
