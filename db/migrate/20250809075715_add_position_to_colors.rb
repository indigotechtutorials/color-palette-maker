class AddPositionToColors < ActiveRecord::Migration[8.0]
  def change
    add_column :colors, :position, :integer
  end
end
