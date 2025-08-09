module ColorPalettes
  class BaseController < ApplicationController
    before_action :set_color_palette
  
  private
    def set_color_palette
      @color_palette = ColorPalette.friendly.find(params[:color_palette_id])
    end
  end
end