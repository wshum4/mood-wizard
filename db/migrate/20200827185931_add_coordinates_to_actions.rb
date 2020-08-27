class AddCoordinatesToActions < ActiveRecord::Migration[6.0]
  def change
    add_column :actions, :latitude, :float
    add_column :actions, :longitude, :float
  end
end
