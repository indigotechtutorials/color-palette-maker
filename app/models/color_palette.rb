class ColorPalette < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :colors

  def header_color
    colors.find_by(category: "Header")&.hex || colors.find_by(position: 1)&.hex || "black"
  end

  def background_color
    colors.find_by(category: "Background")&.hex || colors.find_by(position: 2)&.hex || "white"
  end

  def paragraph_color
    colors.find_by(category: "Paragraph")&.hex || colors.find_by(position: 3)&.hex || "gray"
  end

  def button_background_color
    colors.find_by(category: "Button Background")&.hex || colors.find_by(position: 4)&.hex || "black"
  end

  def button_text_color
    colors.find_by(category: "Button Text")&.hex || colors.find_by(position: 2)&.hex || "white"
  end
end
