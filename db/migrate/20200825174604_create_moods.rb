class CreateMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :moods do |t|
      t.integer :sad_happy
      t.integer :angry_calm
      t.integer :lowenergy_highenergy
      t.integer :anxious_social
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
