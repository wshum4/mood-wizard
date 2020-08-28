class AddBackgroundImageToAction < ActiveRecord::Migration[6.0]
  def change
    add_column :actions, :background_image_url, :string
  end
end
