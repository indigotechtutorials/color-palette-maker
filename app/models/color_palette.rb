class ColorPalette < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :colors
end
