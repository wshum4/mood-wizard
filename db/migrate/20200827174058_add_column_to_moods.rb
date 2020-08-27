class AddColumnToMoods < ActiveRecord::Migration[6.0]
  def change
    add_column :moods, :manual_created_at, :datetime
  end
end
