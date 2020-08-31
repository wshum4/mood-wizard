class AddUserActionFieldToMoods < ActiveRecord::Migration[6.0]
  def change
    add_reference :moods, :user_action, null: true, foreign_key: true
  end
end
