class RemoveFieldFromUserActions < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_actions, :start_time
    remove_column :user_actions, :end_time
  end
end
