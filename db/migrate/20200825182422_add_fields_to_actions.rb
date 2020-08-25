class AddFieldsToActions < ActiveRecord::Migration[6.0]
  def change
    add_column :actions, :description, :text
    add_column :actions, :tags, :string, array: true
  end
end
