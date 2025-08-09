module ColorPalettes
  class ColorsController < ApplicationController
    before_action :set_color_palette
    before_action :set_color, only: [:update, :destroy]
    def create
      @color_palette.colors.create(color_params)
      head :ok
    end

    def update
      @color.update(color_params)
      head :ok
    end

    def destroy
      @color.destroy!
      head :ok
    end
  private
    def set_color_palette
      @color_palette = ColorPalette.friendly.find(params[:color_palette_id])
    end

    def set_color
      @color = @color_palette.colors.find(params[:id])
    end
    
    def color_params
      params.expect(color: [:hex, :category])
    end
  end
end