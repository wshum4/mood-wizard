class CreateMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :moods do |t|
      t.integer :happy_sad
      t.integer :calm_angry
      t.integer :highenergy_lowenergy
      t.integer :social_anxious
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
