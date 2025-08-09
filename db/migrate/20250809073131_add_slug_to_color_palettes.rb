class AddSlugToColorPalettes < ActiveRecord::Migration[8.0]
  def change
    add_column :color_palettes, :slug, :string
    add_index :color_palettes, :slug, unique: true
  end
end
