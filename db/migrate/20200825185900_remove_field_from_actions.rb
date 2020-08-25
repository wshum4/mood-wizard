class RemoveFieldFromActions < ActiveRecord::Migration[6.0]
  def change
    remove_column :actions, :end_time
  end
end
