class AddMoreFieldsToActions < ActiveRecord::Migration[6.0]
  def change
    add_column :actions, :company_name, :string
    add_column :actions, :address, :string
    add_column :actions, :price, :integer
  end
end
