class CreateColors < ActiveRecord::Migration[8.0]
  def change
    create_table :colors do |t|
      t.belongs_to :color_pallete, null: false, foreign_key: true
      t.string :hex

      t.timestamps
    end
  end
end
