class AddSlugToColorPalletes < ActiveRecord::Migration[8.0]
  def change
    add_column :color_palletes, :slug, :string
    add_index :color_palletes, :slug, unique: true
  end
end
