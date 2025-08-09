class Color < ApplicationRecord
  belongs_to :color_palette
  acts_as_list scope: :color_palette

  after_create_commit :broadcast_new_color
  after_destroy_commit :broadcast_remove_color
private
  def broadcast_new_color
    broadcast_append_to(color_palette, target: "color-palette", partial: "color_palettes/color",
      locals: { color: self })
  end

  def broadcast_remove_color
    broadcast_remove_to(color_palette, target: ActionView::RecordIdentifier.dom_id(self))
  end
end