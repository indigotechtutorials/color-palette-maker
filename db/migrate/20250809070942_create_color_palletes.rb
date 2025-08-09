class CreateColorPalletes < ActiveRecord::Migration[8.0]
  def change
    create_table :color_palletes do |t|
      t.string :name

      t.timestamps
    end
  end
end
