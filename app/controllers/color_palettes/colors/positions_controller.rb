module ColorPalettes
  module Colors
    class PositionsController < ApplicationController
      before_action :set_color_palette, :set_color
      def create
        @color.insert_at(params[:position]) if params[:position].present?
        head :ok
      end
    private
      def set_color_palette
        @color_palette = ColorPalette.friendly.find(params[:color_palette_id])
      end

      def set_color
        @color = @color_palette.colors.find(params[:color_id])
      end
    end
  end
end