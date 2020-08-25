class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :url
      t.string :type
      t.integer :happy_sad
      t.integer :calm_angry
      t.integer :highenergy_lowenergy
      t.integer :social_anxious
      t.time :duration
      t.string :time_of_day, array: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
