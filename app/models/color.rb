class Color < ApplicationRecord
  belongs_to :color_pallete

  after_create_commit :broadcast_new_color
  after_destroy_commit :broadcast_remove_color
private
  def broadcast_new_color
    broadcast_append_to(color_pallete, target: "color-pallete", partial: "color_palletes/color",
      locals: { color: self })
  end

  def broadcast_remove_color
    broadcast_remove_to(color_pallete, target: ActionView::RecordIdentifier.dom_id(self))
  end
end
