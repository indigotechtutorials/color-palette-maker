class CreateColorPalettes < ActiveRecord::Migration[8.0]
  def change
    create_table :color_palettes do |t|
      t.string :name

      t.timestamps
    end
  end
end
