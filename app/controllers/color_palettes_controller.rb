class ColorPalettesController < ApplicationController
  before_action :set_color_palette, only: %i[ show edit update destroy ]

  # GET /color_palettes or /color_palettes.json
  def index
    @color_palettes = ColorPalette.all
  end

  # GET /color_palettes/1 or /color_palettes/1.json
  def show
  end

  # GET /color_palettes/new
  def new
    @color_palette = ColorPalette.new
  end

  # GET /color_palettes/1/edit
  def edit
  end

  # POST /color_palettes or /color_palettes.json
  def create
    @color_palette = ColorPalette.new(color_palette_params)

    respond_to do |format|
      if @color_palette.save
        format.html { redirect_to @color_palette, notice: "Color palette was successfully created." }
        format.json { render :show, status: :created, location: @color_palette }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @color_palette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /color_palettes/1 or /color_palettes/1.json
  def update
    respond_to do |format|
      if @color_palette.update(color_palette_params)
        format.html { redirect_to @color_palette, notice: "Color palette was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @color_palette }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @color_palette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_palettes/1 or /color_palettes/1.json
  def destroy
    @color_palette.destroy!

    respond_to do |format|
      format.html { redirect_to color_palettes_path, notice: "Color palette was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_palette
      @color_palette = ColorPalette.friendly.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def color_palette_params
      params.expect(color_palette: [ :name ])
    end
end
