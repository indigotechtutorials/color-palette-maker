class ColorPalletesController < ApplicationController
  before_action :set_color_pallete, only: %i[ show edit update destroy ]

  # GET /color_palletes or /color_palletes.json
  def index
    @color_palletes = ColorPallete.all
  end

  # GET /color_palletes/1 or /color_palletes/1.json
  def show
  end

  # GET /color_palletes/new
  def new
    @color_pallete = ColorPallete.new
  end

  # GET /color_palletes/1/edit
  def edit
  end

  # POST /color_palletes or /color_palletes.json
  def create
    @color_pallete = ColorPallete.new(color_pallete_params)

    respond_to do |format|
      if @color_pallete.save
        format.html { redirect_to @color_pallete, notice: "Color pallete was successfully created." }
        format.json { render :show, status: :created, location: @color_pallete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @color_pallete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /color_palletes/1 or /color_palletes/1.json
  def update
    respond_to do |format|
      if @color_pallete.update(color_pallete_params)
        format.html { redirect_to @color_pallete, notice: "Color pallete was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @color_pallete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @color_pallete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /color_palletes/1 or /color_palletes/1.json
  def destroy
    @color_pallete.destroy!

    respond_to do |format|
      format.html { redirect_to color_palletes_path, notice: "Color pallete was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color_pallete
      @color_pallete = ColorPallete.friendly.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def color_pallete_params
      params.expect(color_pallete: [ :name ])
    end
end
