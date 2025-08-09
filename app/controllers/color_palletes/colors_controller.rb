module ColorPalletes
  class ColorsController < ApplicationController
    before_action :set_color_pallete
    before_action :set_color, only: [:destroy]
    def create
      @color_pallete.colors.create(color_params)
      head :ok
    end

    def destroy
      @color.destroy!
      head :ok
    end
  private
    def set_color_pallete
      @color_pallete = ColorPallete.friendly.find(params[:color_pallete_id])
    end

    def set_color
      @color = @color_pallete.colors.find(params[:id])
    end
    
    def color_params
      params.expect(color: [:hex])
    end
  end
end